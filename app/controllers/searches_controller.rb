class SearchesController < ApplicationController
  # # GET /searches
  # # GET /searches.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @searches }
    end
  end
  
  def create
    @search = ActsAsXapian::Search.new [Lyric], params[:query], :limit => 10
    @results = @search.results.collect { |r| r[:model] }
    
    respond_to do |format|
      format.html { render :action => :show }
    end
  end

  # GET /searches/:query
  # GET /search/:query
  def show
    @search = ActsAsXapian::Search.new [Lyric], params[:query], :limit => 10
    @results = @search.results.collect { |r| r[:model] }
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @search }
    end
  end
  # 
  # # GET /searches/new
  # # GET /searches/new.xml
  # def new
  #   @search = Search.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @search }
  #   end
  # end
  # 
  # # GET /searches/1/edit
  # def edit
  #   @search = Search.find(params[:id])
  # end
  # 
  # # POST /searches
  # # POST /searches.xml
  # def create
  #   puts "SEARCH POSTED"
  #   render :show
  # end
  # 
  # # PUT /searches/1
  # # PUT /searches/1.xml
  # def update
  #   @search = Search.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @search.update_attributes(params[:search])
  #       flash[:notice] = 'Search was successfully updated.'
  #       format.html { redirect_to(@search) }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @search.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /searches/1
  # # DELETE /searches/1.xml
  # def destroy
  #   @search = Search.find(params[:id])
  #   @search.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(searches_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
