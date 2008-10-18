require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LyricsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "lyrics", :action => "index").should == "/lyrics"
    end
  
    it "should map #new" do
      route_for(:controller => "lyrics", :action => "new").should == "/lyrics/new"
    end
  
    it "should map #show" do
      route_for(:controller => "lyrics", :action => "show", :id => 1).should == "/lyrics/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "lyrics", :action => "edit", :id => 1).should == "/lyrics/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "lyrics", :action => "update", :id => 1).should == "/lyrics/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "lyrics", :action => "destroy", :id => 1).should == "/lyrics/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/lyrics").should == {:controller => "lyrics", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/lyrics/new").should == {:controller => "lyrics", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/lyrics").should == {:controller => "lyrics", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/lyrics/1").should == {:controller => "lyrics", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/lyrics/1/edit").should == {:controller => "lyrics", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/lyrics/1").should == {:controller => "lyrics", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/lyrics/1").should == {:controller => "lyrics", :action => "destroy", :id => "1"}
    end
  end
end
