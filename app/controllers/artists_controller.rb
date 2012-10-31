class ArtistsController < ApplicationController
  
  def create
  @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to artists_path
    else
       render action: "new"
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
      redirect_to artists_path
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def index
    @artists = Artist.all
    @albums = Album.all
    @songs = Song.all    
  end

  def new
    @artist = Artist.new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
      if @artist.update_attributes(params[:artist])
        redirect_to artists_path #removed :notice
      else
        render action: "edit" 
      end
  end
end

