class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def is_user_logged?
  	unless !session[:user_id].nil?
  		redirect_to gists_path
  	end
  end

  def is_user_admin?
    unless !session[:user_id].nil? and current_user.is_admin
      redirect_to posts_path
    end
  end
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
