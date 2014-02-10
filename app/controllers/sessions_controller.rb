class SessionsController < ApplicationController

  def new
  end

  def create
    Rails.logger.debug(params[:session][:user_name])
	Rails.logger.debug(params[:session][:user_password])
	@user = User.find_by_user_name(params[:session][:user_name])
	Rails.logger.debug(@user.inspect)
	respond_to do |format|
	  #if @user && @user.authenticate(params[:session][:user_password])
	  if @user && @user.user_password == params[:session][:user_password]
	    # Sign the user in and redirect to the user's show page.
		 Rails.logger.debug("success")
		 session[:user_id]= @user.id
	    # format.html { redirect_to @user, notice: 'Welcome to the Saturday Night Foodie Night Site.' }
		  format.html { redirect_to main_index_path} 
	  else
	    # Create an error message and re-render the signin form.
		Rails.logger.debug(" not success")
	    format.html { render action: "new" }
	  end
    end
  end   
  
  def destroy
  end
end
