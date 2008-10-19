require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/songs/index.html.erb" do
  include SongsHelper
  
  before(:each) do
    assigns[:songs] = [
      stub_model(Song),
      stub_model(Song)
    ]
  end

  it "should render list of songs" do
    render "/songs/index.html.erb"
  end
end

