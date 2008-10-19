require 'RedCloth'

class Lyric < ActiveRecord::Base
  validates_presence_of :text
  
  acts_as_xapian :texts => [:text]
  
  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'

  belongs_to :song
  
  def to_html
    if text =~ /\n/
      lyric = text.gsub!(/\n/, "<br/>")
    else
      lyric = text
    end
    
    rc = RedCloth.new(lyric)
    rc.to_html
  end
end
