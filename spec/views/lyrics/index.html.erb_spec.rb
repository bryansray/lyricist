require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lyrics/index.html.erb" do
  include LyricsHelper
  
  before(:each) do
    assigns[:lyrics] = [
      stub_model(Lyric),
      stub_model(Lyric)
    ]
  end

  it "should render list of lyrics" do
    render "/lyrics/index.html.erb"
  end
end

