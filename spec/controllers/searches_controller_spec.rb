require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SearchesController do

  def mock_search(stubs={})
    @mock_search ||= mock_model(Search, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all searches as @searches" do
      Search.should_receive(:find).with(:all).and_return([mock_search])
      get :index
      assigns[:searches].should == [mock_search]
    end

    describe "with mime type of xml" do
  
      it "should render all searches as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Search.should_receive(:find).with(:all).and_return(searches = mock("Array of Searches"))
        searches.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested search as @search" do
      Search.should_receive(:find).with("37").and_return(mock_search)
      get :show, :id => "37"
      assigns[:search].should equal(mock_search)
    end
    
    describe "with mime type of xml" do

      it "should render the requested search as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Search.should_receive(:find).with("37").and_return(mock_search)
        mock_search.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new search as @search" do
      Search.should_receive(:new).and_return(mock_search)
      get :new
      assigns[:search].should equal(mock_search)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested search as @search" do
      Search.should_receive(:find).with("37").and_return(mock_search)
      get :edit, :id => "37"
      assigns[:search].should equal(mock_search)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created search as @search" do
        Search.should_receive(:new).with({'these' => 'params'}).and_return(mock_search(:save => true))
        post :create, :search => {:these => 'params'}
        assigns(:search).should equal(mock_search)
      end

      it "should redirect to the created search" do
        Search.stub!(:new).and_return(mock_search(:save => true))
        post :create, :search => {}
        response.should redirect_to(search_url(mock_search))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved search as @search" do
        Search.stub!(:new).with({'these' => 'params'}).and_return(mock_search(:save => false))
        post :create, :search => {:these => 'params'}
        assigns(:search).should equal(mock_search)
      end

      it "should re-render the 'new' template" do
        Search.stub!(:new).and_return(mock_search(:save => false))
        post :create, :search => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested search" do
        Search.should_receive(:find).with("37").and_return(mock_search)
        mock_search.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :search => {:these => 'params'}
      end

      it "should expose the requested search as @search" do
        Search.stub!(:find).and_return(mock_search(:update_attributes => true))
        put :update, :id => "1"
        assigns(:search).should equal(mock_search)
      end

      it "should redirect to the search" do
        Search.stub!(:find).and_return(mock_search(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(search_url(mock_search))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested search" do
        Search.should_receive(:find).with("37").and_return(mock_search)
        mock_search.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :search => {:these => 'params'}
      end

      it "should expose the search as @search" do
        Search.stub!(:find).and_return(mock_search(:update_attributes => false))
        put :update, :id => "1"
        assigns(:search).should equal(mock_search)
      end

      it "should re-render the 'edit' template" do
        Search.stub!(:find).and_return(mock_search(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested search" do
      Search.should_receive(:find).with("37").and_return(mock_search)
      mock_search.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the searches list" do
      Search.stub!(:find).and_return(mock_search(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(searches_url)
    end

  end

end
