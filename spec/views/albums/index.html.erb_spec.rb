require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/albums/index.html.erb" do
  include AlbumsHelper
  
  before(:each) do
    assigns[:albums] = [
      stub_model(Album),
      stub_model(Album)
    ]
  end

  it "should render list of albums" do
    render "/albums/index.html.erb"
  end
end

