require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/albums/new.html.erb" do
  include AlbumsHelper
  
  before(:each) do
    assigns[:album] = stub_model(Album,
      :new_record? => true
    )
  end

  it "should render new form" do
    render "/albums/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", albums_path) do
    end
  end
end


