class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

 
  protect_from_forgery
  helper_method :current_user, :current_user_session
  layout 'application'
  
  def after_sign_in_path_for(resource)
    if current_user.role?("admin")
	redirect_to '/admin'
    elsif current_user.role?("central")
	redirect_to current_user
    else 
        redirect_to root_path
    end
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def authenticate
    if !current_user
    redirect_to new_user_session_path
    end
  end
end
