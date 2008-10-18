require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Artist do
  before(:each) do
  end

  it "should generate a valid artist" do
    artist = Artist.generate
    artist.should be_valid
  end
  
  it "should have many songs" do
    song = Song.generate
    artist = Artist.generate
    artist.songs << song
    artist.should have(1).songs
  end
  
  it "should have many lyrics" do
    lyric = Lyric.generate
    song = Song.generate
    artist = Artist.generate
    
    song.lyrics << lyric
    artist.songs << song
    
    artist.should have(1).lyrics
  end
end
