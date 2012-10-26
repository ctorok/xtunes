class SongsController < ApplicationController 
  before_filter :authorize # if I wanted only on certain defs, I would say: , only [:edit, :update]
  
  def create
  @song = Song.new(params[:song])
    if @song.save
      redirect_to songs_path
    else
       render action: "new"
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
      redirect_to songs_path
  end

  def edit
    @song = Song.find(params[:id])
    @artists = Artist.all
  end

  def index
    @songs = Song.all
    @artists = Artist.all
  end

  def new
    @song = Song.new
      @artists = Artist.all
  end

  def show
    @song = Song.find(params[:id])
  
  end

  def update
    @song = Song.find(params[:id])
      if @song.update_attributes(params[:song])
        redirect_to songs_path #removed :notice
      else
        render action: "edit" 
      end
  end
end

