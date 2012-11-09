class PurchasesController < ApplicationController

  def create
    @purchase = Purchase.new(params[:purchase])
    @purchase.price_paid = Song.find(params[:song_id]).price
    @purchase.user_id = session[:user_id]
    session[:user_id_purchase] = session[:user_id]
    @purchase.song_id = params[:song_id]
    session[:song_id_purchase] = params[:song_id]
   
    if @purchase.save 
      redirect_to songs_path, :notice => "You purchased '#{Song.find(params[:song_id]).name}'."
    else
      render action: "new"
    end
  end

  # def destroy
  #   @song = Song.find(params[:id])
  #   @song.destroy
  #     redirect_to songs_path
  # end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def index
    if !current_user
      @purchases = Purchase.all
    else
      @purchases = Purchase.where("user_id = ?", session[:user_id])
    end
  end

 def new
    @purchase = Purchase.new
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
      if @purchase.update_attributes(params[:purchase])
        redirect_to purchases_path #removed :notice
      else
        render action: "edit" 
      end
  end

end

