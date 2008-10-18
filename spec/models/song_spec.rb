require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Song do
  before(:each) do
  end

  it "should generate a valid song" do
    song = Song.generate
    song.should be_valid
  end
  
  it "should have many lyrics associated with it" do
    lyric = Lyric.generate
    song = Song.generate
    song.lyrics << lyric
    song.should have(1).lyrics
  end
end
