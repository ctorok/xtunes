class GenresController < ApplicationController
  
  def create
  @genre = Genre.new(params[:genre])
    if @genre.save
      redirect_to genres_path
    else
       render action: "new"
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
      redirect_to genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def update
    @genre = Genre.find(params[:id])
      if @genre.update_attributes(params[:genre])
        redirect_to genres_path #removed :notice
      else
        render action: "edit" 
      end
  end
end

