require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/searches/index.html.erb" do
  include SearchesHelper
  
  before(:each) do
    assigns[:searches] = [
      stub_model(Search,
        :keywords => "value for keywords"
      ),
      stub_model(Search,
        :keywords => "value for keywords"
      )
    ]
  end

  it "should render list of searches" do
    render "/searches/index.html.erb"
    response.should have_tag("tr>td", "value for keywords", 2)
  end
end

