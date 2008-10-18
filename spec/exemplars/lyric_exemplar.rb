class Lyric < ActiveRecord::Base
  generator_for :text, "This is the lyric!!"
end