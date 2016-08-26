class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  # def require_login
  #   redirect_to '/' if session[:user_id] == nil
  # end

  def loggedin?
  	if  !session.has_key?(:user_id)
  		flash[:errors]=["You are not logged in"]
  		redirect_to "/"
  		return
  	end
  end
end
