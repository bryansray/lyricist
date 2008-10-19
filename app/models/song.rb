class Song < ActiveRecord::Base
  # Associations
  belongs_to :album
  belongs_to :artist
  
  has_many :lyrics
  
  def to_s
    title
  end
end
