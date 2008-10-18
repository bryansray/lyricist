require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LyricsController do

  def mock_lyric(stubs={})
    @mock_lyric ||= mock_model(Lyric, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all lyrics as @lyrics" do
      Lyric.should_receive(:find).with(:all).and_return([mock_lyric])
      get :index
      assigns[:lyrics].should == [mock_lyric]
    end

    describe "with mime type of xml" do
  
      it "should render all lyrics as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Lyric.should_receive(:find).with(:all).and_return(lyrics = mock("Array of Lyrics"))
        lyrics.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested lyric as @lyric" do
      Lyric.should_receive(:find).with("37").and_return(mock_lyric)
      get :show, :id => "37"
      assigns[:lyric].should equal(mock_lyric)
    end
    
    describe "with mime type of xml" do

      it "should render the requested lyric as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Lyric.should_receive(:find).with("37").and_return(mock_lyric)
        mock_lyric.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
    before(:each) do
      controller.stub!(:current_user).and_return(mock_user)
    end
    it "should expose a new lyric as @lyric" do
      Lyric.should_receive(:new).and_return(mock_lyric)
      get :new
      assigns[:lyric].should equal(mock_lyric)
    end

  end

  describe "responding to GET edit" do
    before(:each) do
      controller.stub!(:current_user).and_return(mock_user)
    end
    
    it "should expose the requested lyric as @lyric" do
      Lyric.should_receive(:find).with("37").and_return(mock_lyric)
      get :edit, :id => "37"
      assigns[:lyric].should equal(mock_lyric)
    end

  end

  describe "responding to POST create" do
    before(:each) do
      @current_user = mock_user
      controller.stub!(:current_user).and_return(@current_user)
    end
    
    describe "with valid params" do
      it "should set the current user as the owner of the lyrics" do
        lyric = Lyric.stub!(:new).and_return(mock_lyric(:save => true))
        mock_lyric.should_receive(:owner=).with(@current_user)
        post :create, :lyric => {}
      end
      
      it "should expose a newly created lyric as @lyric" do
        Lyric.should_receive(:new).with({'these' => 'params'}).and_return(mock_lyric(:save => true))
        mock_lyric.stub!(:owner=)
        post :create, :lyric => {:these => 'params'}
        assigns(:lyric).should equal(mock_lyric)
      end

      it "should redirect to the created lyric" do
        Lyric.stub!(:new).and_return(mock_lyric(:save => true))
        mock_lyric.stub!(:owner=)
        post :create, :lyric => {}
        response.should redirect_to(lyric_url(mock_lyric))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved lyric as @lyric" do
        Lyric.stub!(:new).with({'these' => 'params'}).and_return(mock_lyric(:save => false))
        mock_lyric.stub!(:owner=)
        post :create, :lyric => {:these => 'params'}
        assigns(:lyric).should equal(mock_lyric)
      end

      it "should re-render the 'new' template" do
        Lyric.stub!(:new).and_return(mock_lyric(:save => false))
        mock_lyric.stub!(:owner=)
        post :create, :lyric => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do
    before(:each) do
      controller.stub!(:current_user).and_return(mock_user)
    end
    
    describe "with valid params" do

      it "should update the requested lyric" do
        Lyric.should_receive(:find).with("37").and_return(mock_lyric)
        mock_lyric.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :lyric => {:these => 'params'}
      end

      it "should expose the requested lyric as @lyric" do
        Lyric.stub!(:find).and_return(mock_lyric(:update_attributes => true))
        put :update, :id => "1"
        assigns(:lyric).should equal(mock_lyric)
      end

      it "should redirect to the lyric" do
        Lyric.stub!(:find).and_return(mock_lyric(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(lyric_url(mock_lyric))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested lyric" do
        Lyric.should_receive(:find).with("37").and_return(mock_lyric)
        mock_lyric.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :lyric => {:these => 'params'}
      end

      it "should expose the lyric as @lyric" do
        Lyric.stub!(:find).and_return(mock_lyric(:update_attributes => false))
        put :update, :id => "1"
        assigns(:lyric).should equal(mock_lyric)
      end

      it "should re-render the 'edit' template" do
        Lyric.stub!(:find).and_return(mock_lyric(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do
    before(:each) do
      controller.stub!(:current_user).and_return(mock_user)
    end
    
    it "should destroy the requested lyric" do
      Lyric.should_receive(:find).with("37").and_return(mock_lyric)
      mock_lyric.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the lyrics list" do
      Lyric.stub!(:find).and_return(mock_lyric(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(lyrics_url)
    end

  end

end
