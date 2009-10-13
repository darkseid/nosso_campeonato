class Championship < ActiveRecord::Base
  has_many :phases

  def winner?
    
  end
end
