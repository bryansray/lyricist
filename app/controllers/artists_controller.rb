class ArtistsController < ApplicationController
  def index
    @artists = Artist.find(:all).paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.rss # index.rss.builder
      format.xml  { render :xml => @artists }
    end
  end

  def show
    @artist = Artist.find params[:id]
    
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def new
  end

  def update
  end

  def create
  end

  def destroy
  end

end
