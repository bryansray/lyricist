class ArtistsController < ApplicationController
  def index
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
