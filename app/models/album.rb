class Album < ActiveRecord::Base
  belongs_to :artist
  
  has_many :songs
  
  def to_s
    name
  end
end
