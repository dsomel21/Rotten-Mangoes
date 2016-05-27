class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :require_admin

  protected

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def restrict_access
  	if !current_user
  		flash[:alert] = "You must log in."
  		redirect_to new_session_path
  	end
  end

  def impersonating?
    session[:user_id].present?
  end

  helper_method :current_user, :impersonating?

end