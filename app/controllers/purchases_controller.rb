class PurchasesController < ApplicationController
  
  def create
  @purchase = Purchase.new(params[:purchase])
    if @purchase.save
      redirect_to purchases_path
    else
       render action: "new"
    end
  end

  # def destroy
  #   @song = Song.find(params[:id])
  #   @song.destroy
  #     redirect_to songs_path
  # end

  # def edit
  #   @song = Song.find(params[:id])
  # end

  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  # def update
  #   @song = Song.find(params[:id])
  #     if @song.update_attributes(params[:song])
  #       redirect_to songs_path #removed :notice
  #     else
  #       render action: "edit" 
  #     end
  # end
end

