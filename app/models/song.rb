class Song < ActiveRecord::Base
  # Associations
  belongs_to :album
  belongs_to :artist
  
  has_many :lyrics
end
