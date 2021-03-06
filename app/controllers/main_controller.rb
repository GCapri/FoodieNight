class MainController < ApplicationController
  # GET /users
  # GET /users.json#
  def index
    # TODO @users = User.all  - Need to update to include the logged in user info only
	#@restaurant_ratings = Rating.get_restaurant_ratings(user_id)
	get_current_user
	Rails.logger.debug("current user = #{@current_user.inspect}")
	@rating = Rating.new
	@restaurants = Restaurant.order_by_restaurant_name
	
	# This is where we prepare data for all restaurants and rating values for current user

	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  # GET /welcome.html - What user would type in
  # GET /users.json
   def welcome

    respond_to do |format|
      format.html # welcome.html.erb - What files are being rendered
      format.json { render json: @users }
    end
  end
  
  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Request was successfully submitted.' }
        format.json { render json: @user, status: :created, location: @user}
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
