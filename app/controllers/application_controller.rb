class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#=begin
 
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
  flash[:alert] = exception.message
 
  redirect_to root_url
  end
  helper_method :current_user, :current_user_session
  layout 'application'
  
=begin def after_sign_in_path_for(resource)
    #if current_user.role?("admin")
    #  redirect_to '/admin/committees'
    if current_user.role?("central")
      redirect_to '/committees_voivodships'
    else 
      redirect_to '/committees_districts'
    end
  end
=end
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
#=end
end
