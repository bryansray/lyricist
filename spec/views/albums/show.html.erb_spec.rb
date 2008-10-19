require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/albums/show.html.erb" do
  include AlbumsHelper
  
  before(:each) do
    assigns[:album] = @album = stub_model(Album)
  end

  it "should render attributes in <p>" do
    render "/albums/show.html.erb"
  end
end

