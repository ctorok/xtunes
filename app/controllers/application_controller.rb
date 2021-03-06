class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user #this makes the method accessible not only for the controller here, but also for the view

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
    # this is where I may want to check if the user is an Admin, User or Guest
  end
end
