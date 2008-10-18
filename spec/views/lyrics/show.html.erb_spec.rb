require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lyrics/show.html.erb" do
  include LyricsHelper
  
  before(:each) do
    assigns[:lyric] = @lyric = stub_model(Lyric)
  end

  it "should render attributes in <p>" do
    render "/lyrics/show.html.erb"
  end
end

