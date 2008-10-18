require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lyrics/edit.html.erb" do
  include LyricsHelper
  
  before(:each) do
    assigns[:lyric] = @lyric = stub_model(Lyric,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/lyrics/edit.html.erb"
    
    response.should have_tag("form[action=#{lyric_path(@lyric)}][method=post]") do
    end
  end
end


