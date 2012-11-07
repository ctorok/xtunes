class MixtapesController < ApplicationController
  
  def create
    @mixtape = Mixtape.new(params[:mixtape])
    # @songs = Song.all
    if @mixtape.save
      redirect_to mixtapes_path
    else
       render action: "new"
    end
  end

  def destroy
    @mixtape = Mixtape.find(params[:id])
    @mixtape.destroy
      redirect_to mixtapes_path
  end

  def edit
    @mixtape = Mixtape.find(params[:id])
  end

  def index
    @mixtapes = Mixtape.all
    @songs = Song.all
  end

  def new
    @mixtape = Mixtape.new
  end

  def update
    @mixtape = Mixtape.find(params[:id])
      if @mixtape.update_attributes(params[:mixtape])
        redirect_to mixtapes_path #removed :notice
      else
        render action: "edit" 
      end
  end
end

