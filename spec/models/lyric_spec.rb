require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lyric do
  before(:each) do
  end
  
  it "should generate a valid lyric" do
    lyric = Lyric.generate
    lyric.should be_valid
  end
  
  it "should belong to a specific user" do
    user = User.generate
    lyric = Lyric.generate
    lyric.owner = user
    lyric.owner.should == user
  end
  
  it "should not be a valid lyric if there is no text" do
    lyric = Lyric.generate :text => nil
    lyric.should_not be_valid
  end

end
