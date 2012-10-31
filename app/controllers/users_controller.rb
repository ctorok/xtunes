class UsersController < ApplicationController
  
  def create
  @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: "You are signed in!"
    else
       render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.order(:name)
  end

  def new
    @user = User.new
  end


  def update
    @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        redirect_to users_path, notice: "User #{@user.name} was successfully created."
      else
        render "edit" 
      end
  end
end


