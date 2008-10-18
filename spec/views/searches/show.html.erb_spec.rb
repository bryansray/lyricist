require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/searches/show.html.erb" do
  include SearchesHelper
  
  before(:each) do
    assigns[:search] = @search = stub_model(Search,
      :keywords => "value for keywords"
    )
  end

  it "should render attributes in <p>" do
    render "/searches/show.html.erb"
    response.should have_text(/value\ for\ keywords/)
  end
end

