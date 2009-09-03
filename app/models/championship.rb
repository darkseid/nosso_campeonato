class Championship < ActiveRecord::Base
  has_many :matches

  def winner?
    
  end
end
