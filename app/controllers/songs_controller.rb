class SongsController < ApplicationController 
  load_and_authorize_resource #this comes from the cancan gem, and we can remove setting the @song instance vatriables in the create, destroy, new and show methods
  before_filter :authorize #this comes from the authentication methods
  # don't allow a user to access songs unless they are logged in. See authorize method in the applications controller
  # if I wanted only on certain defs, I would say: , only [:edit, :update]
  
  def index
    @songs = Song.order(:name)   #get all songs, ordered alpha by name
    @artists = Artist.order(:name)
    @albums = Album.order(:name)
  end

  def show
  end

  def new
    @artists = Artist.all
  end

  def create
    if @song.save
      redirect_to songs_path
    else
       render action: "new"
    end
  end

  def edit
    # if session[:user_id].downcase != "a"
    #   redirect_to songs_path, flash[:notice] = "Sorry, you don’t have permission to do this"
    # end
    @artists = Artist.all
  end

  def destroy
    @song.destroy
      redirect_to songs_path
  end

  def update
    if @song.update_attributes(params[:song])
      redirect_to songs_path #removed :notice
    else
      render action: "edit" 
    end
  end
end

