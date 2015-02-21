class UserSessionsController < ApplicationController
 def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
	#after_sign_in_path_for(User)
        #redirect_to root_path
         if current_user.role?("central")
            redirect_to '/central'
         else 
            redirect_to '/role_district'
         end
    else
      render :action => 'new'
    end
  end
  
 
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end
