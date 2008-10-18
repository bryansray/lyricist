class Lyric < ActiveRecord::Base
  validates_presence_of :text
  
  belongs_to :owner, :class_name => 'User'
end
