require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/songs/edit.html.erb" do
  include SongsHelper
  
  before(:each) do
    assigns[:song] = @song = stub_model(Song,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/songs/edit.html.erb"
    
    response.should have_tag("form[action=#{song_path(@song)}][method=post]") do
    end
  end
end


