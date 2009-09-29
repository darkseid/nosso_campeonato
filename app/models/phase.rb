class Phase < ActiveRecord::Base
  belongs_to :championship
  has_many :matches
  
  validates_presence_of :championship_id, :on => :create, :message => "A fase deve pertencer a um campeonato"
  
  def forward
    m = Match.new
    m.teams << matches[0].winner
    m.teams << matches[1].winner
    m
  end
  
  def add_match match
    matches << match
  end
  
end
