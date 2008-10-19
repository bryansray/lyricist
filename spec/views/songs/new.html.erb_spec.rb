require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/songs/new.html.erb" do
  include SongsHelper
  
  before(:each) do
    assigns[:song] = stub_model(Song,
      :new_record? => true
    )
  end

  it "should render new form" do
    render "/songs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", songs_path) do
    end
  end
end


