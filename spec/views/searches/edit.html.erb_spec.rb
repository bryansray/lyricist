require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/searches/edit.html.erb" do
  include SearchesHelper
  
  before(:each) do
    assigns[:search] = @search = stub_model(Search,
      :new_record? => false,
      :keywords => "value for keywords"
    )
  end

  it "should render edit form" do
    render "/searches/edit.html.erb"
    
    response.should have_tag("form[action=#{search_path(@search)}][method=post]") do
      with_tag('input#search_keywords[name=?]', "search[keywords]")
    end
  end
end


