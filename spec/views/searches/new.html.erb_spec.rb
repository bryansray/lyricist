require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/searches/new.html.erb" do
  include SearchesHelper
  
  before(:each) do
    assigns[:search] = stub_model(Search,
      :new_record? => true,
      :keywords => "value for keywords"
    )
  end

  it "should render new form" do
    render "/searches/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", searches_path) do
      with_tag("input#search_keywords[name=?]", "search[keywords]")
    end
  end
end


