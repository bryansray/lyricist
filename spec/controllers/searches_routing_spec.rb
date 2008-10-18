require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SearchesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "searches", :action => "index").should == "/searches"
    end
  
    it "should map #new" do
      route_for(:controller => "searches", :action => "new").should == "/searches/new"
    end
  
    it "should map #show" do
      route_for(:controller => "searches", :action => "show", :id => 1).should == "/searches/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "searches", :action => "edit", :id => 1).should == "/searches/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "searches", :action => "update", :id => 1).should == "/searches/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "searches", :action => "destroy", :id => 1).should == "/searches/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/searches").should == {:controller => "searches", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/searches/new").should == {:controller => "searches", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/searches").should == {:controller => "searches", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/searches/1").should == {:controller => "searches", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/searches/1/edit").should == {:controller => "searches", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/searches/1").should == {:controller => "searches", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/searches/1").should == {:controller => "searches", :action => "destroy", :id => "1"}
    end
  end
end
