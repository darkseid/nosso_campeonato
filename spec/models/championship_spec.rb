require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Championship do
  fixtures :teams
  
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
      @factory = PlayoffFactory.new
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
        champ.phases[0].matches[0].home.name.should == 'Corinthians'
        champ.phases[0].matches[0].visitor.name.should == 'Santos'    
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
        m1.home.name.should == 'Corinthians'
        m1.visitor.name.should == 'Santos'  

        m2 = phase_1.matches[1]
        m2.home.name.should == 'Sao Paulo'
        m2.visitor.name.should == 'Palmeiras'
    end
  end
      
  private 
  def match home_team, visitor_team
    Match.new({:home => teams(home_team), :visitor => teams(visitor_team)})
  end
end
