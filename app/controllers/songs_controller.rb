class SongsController < ApplicationController
  
  def create
  @song = Song.new(params[:song])
    if @song.save
      redirect_to songs_path, notice: 'song was successfully created.'
    else
       render action: "new"
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
      if @song.update_attributes(params[:song])
        redirect_to @song, notice: 'song was successfully updated.' 
      else
        render action: "edit" 
      end
  end


  def destroy
    @song = Song.find(params[:id])
    @song.destroy
      redirect_to songs_url 
  end
end
