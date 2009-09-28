class Phase < ActiveRecord::Base
  belongs_to :championship
  has_many :matches
  
  validates_presence_of :championship_id, :on => :create, :message => "A fase deve pertencer a um campeonato"
end
