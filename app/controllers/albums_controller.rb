class AlbumsController < ApplicationController
  
  def create
    @album = Album.new(params[:album])
    # @album.genres = (params[:genres].present? ? params[:genres] : [])
    if @album.save
      redirect_to albums_path
      else
      render action: "new"
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  def edit
    @album = Album.find(params[:id])
  end

  def index
    @albums = Album.all
    @artists = Artist.all
    @songs = Song.all
    @genres = Genre.all
  end

  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to albums_path #removed :notice
      else
      render action: "edit" 
    end
  end
end

