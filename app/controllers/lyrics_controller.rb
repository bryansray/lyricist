class LyricsController < ApplicationController
  before_filter :login_required, :only => [:new, :edit, :create, :update, :destroy]

  # GET /lyrics
  # GET /lyrics.xml
  def index
    @lyrics = Lyric.find(:all)
    @artists = Artist.find :all, :limit => 5
    @albums = Album.find :all, :limit => 5
    @songs = Song.find :all, :limit => 5

    respond_to do |format|
      format.html # index.html.erb
      format.rss # index.rss.builder
      format.xml  { render :xml => @lyrics }
    end
  end

  # GET /lyrics/1
  # GET /lyrics/1.xml
  def show
    @lyric = Lyric.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lyric }
    end
  end

  # GET /lyrics/new
  # GET /lyrics/new.xml
  def new
    @artist = Artist.find params[:artist_id] if params[:artist_id]
    @album = Album.find params[:album_id] if params[:album_id]
    @song = Song.find params[:song_id] if params[:song_id]
    @lyric = Lyric.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lyric }
    end
  end

  # GET /lyrics/1/edit
  def edit
    @lyric = Lyric.find(params[:id])
  end

  # POST /lyrics
  # POST /lyrics.xml
  def create
    artist = Artist.find_or_create_by_name params[:artist][:name]
    album = Album.find_or_create_by_name params[:album][:name]
    song = Song.find_or_create_by_title params[:song][:title]
    
    song.album = album
    song.artist = artist
    
    @lyric = Lyric.new(params[:lyric])
    @lyric.owner = current_user
    @lyric.song = song
    
    respond_to do |format|
      if @lyric.save
        flash[:notice] = 'Lyric was successfully created.'
        format.html { redirect_to song }
        format.xml  { render :xml => @lyric, :status => :created, :location => @lyric }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lyric.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lyrics/1
  # PUT /lyrics/1.xml
  def update
    @lyric = Lyric.find(params[:id])

    respond_to do |format|
      if @lyric.update_attributes(params[:lyric])
        flash[:notice] = 'Lyric was successfully updated.'
        format.html { redirect_to(@lyric) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lyric.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lyrics/1
  # DELETE /lyrics/1.xml
  def destroy
    @lyric = Lyric.find(params[:id])
    @lyric.destroy

    respond_to do |format|
      format.html { redirect_to(lyrics_url) }
      format.xml  { head :ok }
    end
  end

end
