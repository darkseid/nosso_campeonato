require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Championship do
  fixtures :teams
  
  context "Basic" do
    
    it "should have turns, and each turn, should have phases" do
      
      champ_teams = []
      (1..8).each {|i| champ_teams << Team.new(:name => i.to_s )}
      
      champ = PlayoffBuilder.new.build_championship champ_teams
      
      champ.turns.size == 1
      
      phases = champ.turns.first.phases
      
      phases.first.matches.size == 4
      
    end
    
    
  end
  
  
  context "with all-for-all structure" do
  
    before(:each) do
      @teams = [teams(:corinthians), teams(:santos), teams(:gremio),
         teams(:palmeiras), teams(:internacional), teams(:sao_paulo)]
    
    end

    it "with 2 teams, should generate 1 match" do
      champ = ChampionshipFactory.build_championship([teams(:corinthians), teams(:santos)])
      champ.should have(1).phases
    
      p = champ.phases[0]
      p.should have(1).matches
    
      p.matches[0].should_not be_nil
      p.matches[0].should be_eql match(:corinthians, :santos)
    end

    it "with 4 teams, should generate 6 matches" do
      pending "not yet implemented"
      champ = ChampionshipFactory.build_championship [teams(:corinthians), teams(:santos), 
                                                      teams(:palmeiras), teams(:sao_paulo)]
      champ.should have(1).phases
      p = champ.phases[0]
      p.should have(6).matches
    
    
      p.matches[0].to_s.should == match(:corinthians, :palmeiras).to_s
      p.matches[1].to_s.should == match(:santos, :sao_paulo).to_s
    
      p.matches[2].to_s.should be_eql match(:sao_paulo, :corinthians).to_s
      p.matches[3].to_s.should be_eql match(:palmeiras, :santos).to_s
    
      p.matches[4].to_s.should be_eql match(:corinthians, :santos).to_s
      p.matches[5].to_s.should be_eql match(:sao_paulo, :santos).to_s
    end
  end
  
  context "with playoff structure" do
    before(:each) do
      @factory = PlayoffBuilder.new
    end
     
    specify "should build a championship with maximum 16 teams" do
      champ_teams = []
      (1..17).each {|i| champ_teams << Team.new(:name => i.to_s )}
      
      lambda {
        @factory.build_championship champ_teams
      }.should raise_error(RuntimeError, "Utilize no máximo 16 times")
    end
     
    specify "should build a championship with 1 match for 2 teams" do

        teams = []
        teams << Factory(:corinthians)
        teams << Factory(:santos)

        champ = @factory.build_championship teams

        champ.phases.size.should == 1
        champ.phases[0].matches.size.should == 1
        
        teams.should include champ.phases[0].matches[0].home
        teams.should include champ.phases[0].matches[0].visitor
        
        #champ.phases[0].matches[0].home.name.should == 'Corinthians'
        #champ.phases[0].matches[0].visitor.name.should == 'Santos'    
    end

    specify "should build a championship with 2 match in phase 1, for 4 teams" do

        teams = []
        teams << Factory(:corinthians)
        teams << Factory(:santos)
        teams << Factory(:sao_paulo)
        teams << Factory(:palmeiras)

        champ = @factory.build_championship teams

        champ.phases.size.should == 1
        phase_1 = champ.phases[0]
        phase_1.matches.size.should == 2

        m1 = phase_1.matches[0]
        teams.should include m1.home
        teams.should include m1.visitor
#        m1.home.name.should == 'Corinthians'
#        m1.visitor.name.should == 'Santos'  

        m2 = phase_1.matches[1]
        teams.should include m1.home
        teams.should include m1.visitor        
        #m2.home.name.should == 'Sao Paulo'
        #m2.visitor.name.should == 'Palmeiras'
    end

  
    specify "should build a championship with 4 matches in phase 1, for 5 teams, and 2 Empty teams must not match" do
        teams = []
        teams << Factory(:corinthians)
        teams << Factory(:santos)
        teams << Factory(:sao_paulo)
        teams << Factory(:palmeiras)
        teams << Factory(:gremio)
    
        champ = @factory.build_championship teams

        champ.phases.size.should == 1
        phase_1 = champ.phases[0]
        phase_1.matches.size.should == 4
        
        phase_1.matches.each { |m| m.home.name.should_not be_nil if m.visitor.name.nil? }
    end  
    
    specify "should get 1 more match for second phase in a 4 teams championship" do
    	  teams = [Factory(:corinthians), Factory(:santos), Factory(:sao_paulo), Factory(:palmeiras)]
    	
    		champ = @factory.build_championship teams
    		
    		# Fase 1: Os time da casa ganham
    		phase_1 = champ.phases[0]
    		phase_1.matches[0].home_score = 2
    		phase_1.matches[1].home_score = 1
    		phase_1.done!
    		
    		phase_2 = champ.next_phase
    		phase_2.matches.size.should == 1
    		phase_2.matches[0].home.name.should == phase_1.matches[0].winner.name
    		phase_2.matches[0].visitor.name.should == phase_1.matches[1].winner.name
   	end  
   	
    specify "should get 2 more match for second phase in a 8 teams championship" do
    	  teams = [Factory(:corinthians), Factory(:santos), Factory(:sao_paulo), Factory(:palmeiras),
    	  Factory(:corinthians), Factory(:santos), Factory(:sao_paulo), Factory(:palmeiras)]
    	
    		champ = @factory.build_championship teams
    		
    		# Fase 1: Os time da casa ganham
    		phase_1 = champ.phases[0]
    		phase_1.matches[0].home_score = 2
    		phase_1.matches[1].home_score = 1
    		phase_1.matches[2].home_score = 3
    		phase_1.matches[3].home_score = 1    		
    		phase_1.done!
    		
    		phase_2 = champ.next_phase
    		phase_2.matches.size.should == 2
    		phase_2.matches[0].home.name.should == phase_1.matches[0].home.name
    		phase_2.matches[0].visitor.name.should == phase_1.matches[1].home.name
    		phase_2.matches[1].home.name.should == phase_1.matches[2].home.name
    		phase_2.matches[1].visitor.name.should == phase_1.matches[3].home.name
    		
    		# Fase 2: Times visitantes vencem
    		phase_2.matches[0].visitor_score = 1
    		phase_2.matches[1].visitor_score = 1
    		phase_2.done!
    		
    		# Fase 3
    		phase_3 = champ.next_phase
    		phase_3.matches.size.should == 1
    		phase_3.matches[0].home.name.should == phase_2.matches[0].visitor.name
    		phase_3.matches[0].visitor.name.should == phase_2.matches[1].visitor.name

    		phase_3.matches[0].home_score = 3
    		phase_3.done!
    		
    		# Campeao do campeonato
    		champ.should be_finished
    		champ.winner.should_not be_nil
    		champ.winner.should == phase_3.matches[0].home
    		
   	end   	
   	
  end
  
  private 
  def match home_team, visitor_team
    Match.new({:home => teams(home_team), :visitor => teams(visitor_team)})
  end
end
