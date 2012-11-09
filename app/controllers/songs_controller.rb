class SongsController < ApplicationController 
  load_and_authorize_resource #this comes from the cancan gem, and we can remove setting the @song instance vatriables in the create, destroy, new and show methods
  before_filter :authorize #this comes from the authentication methods
  # don't allow a user to access songs unless they are logged in. See authorize method in the applications controller
  # if I wanted only on certain defs, I would say: , only [:edit, :update]
  
  def index
    
     session[:user_id_session] = session[:user_id]
     
    if current_user && current_user.user_type != "A"
      #get user's purchased songs, only the ids; if p returns blank array, then no purchases
      p = Purchase.where("user_id = ?", session[:user_id]).collect(&:song_id)

      if p != []

        songs_table = Arel::Table.new(:songs)
        # the below will have the songs that the user has not purchased!
        @songs = Song.where(songs_table[:id].not_in p)
        # raise @songs.inspect
      elsif current_user && current_user.user_type == "A"
        @songs = Song.all #order(:name)   #get all songs, ordered alpha by name
      end
      # raise @songs.inspect
  end

    # @search = Song.search(params[:q])
    # @songs = @search.result
  end

  def show
    @song = Song.find(params[:id])
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

