require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lyrics/new.html.erb" do
  include LyricsHelper
  
  before(:each) do
    assigns[:lyric] = stub_model(Lyric,
      :new_record? => true
    )
  end

  it "should render new form" do
    render "/lyrics/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", lyrics_path) do
    end
  end
end


