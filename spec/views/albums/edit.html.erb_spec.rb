require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/albums/edit.html.erb" do
  include AlbumsHelper
  
  before(:each) do
    assigns[:album] = @album = stub_model(Album,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/albums/edit.html.erb"
    
    response.should have_tag("form[action=#{album_path(@album)}][method=post]") do
    end
  end
end


