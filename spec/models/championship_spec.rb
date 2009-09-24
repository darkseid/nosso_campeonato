require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Championship do
  fixtures :teams
  
  before(:each) do
    @teams = [teams(:corinthians), teams(:santos), teams(:gremio),
       teams(:palmeiras), teams(:internacional), teams(:sao_paulo)]
    
  end

  it "with 2 teams, should generate 1 match" do
    champ = ChampionshipFactory.build_championship([teams(:corinthians), teams(:santos)])
    champ.should have(1).matches
    champ.matches[0].should_not be_nil
    champ.matches[0].should be_eql match(:corinthians, :santos)
  end

  it "with 4 teams, should generate 6 matches" do
    champ = ChampionshipFactory.build_championship [teams(:corinthians), teams(:santos), 
                                                    teams(:palmeiras), teams(:sao_paulo)]
    champ.should have(6).matches
    
    champ.matches[0].to_s.should == match(:corinthians, :palmeiras).to_s
    champ.matches[1].should be_eql match(:santos, :sao_paulo)
    
    champ.matches[2].should be_eql match(:sao_paulo, :corinthians)
    champ.matches[3].should be_eql match(:palmeiras, :santos)
    
    champ.matches[4].should be_eql match(:corinthians, :santos)
    champ.matches[5].should be_eql match(:sao_paulo, :santos)   
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
     
    specify "and 4 teams, should build this championship [team1 x team2 | team3 x team4 | winner 1 x winner 2]" do
      
      c = @factory.build_championship @teams[1..4]
      c.matches.size.should == 3
     
    end
    
  end
  
  private 
  def match home_team, visitor_team
    Match.new({:home_team => teams(home_team), :foreign_team => teams(visitor_team)})
  end
end
