class Lyric < ActiveRecord::Base
  validates_presence_of :text
  
  acts_as_xapian :texts => [:text]
  
  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :song
end
