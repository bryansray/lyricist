class Artist < ActiveRecord::Base
  has_many :songs
  has_many :lyrics, :through => :songs
  has_many :albums
end
