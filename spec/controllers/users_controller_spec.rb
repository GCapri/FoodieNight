require 'spec_helper'

describe UsersController do

 # Getting a valid session
  def valid_session
    {}
  end

  describe "GET index method" do
    it "assigns all users as @users" do
      user = FactoryGirl.create(:user)
      get :index, {}, valid_session
	  #Do a get for the index method for this controller(UserController) ... in this case its the users
      assigns(:users).should eq([user])
	  #assigns ... assign instance variable @users ... review later
	end
	
	it "assigns all in alpha order as @users" do
      user1 = FactoryGirl.create(:user, {:user_name => "abby"})
	  user2 = FactoryGirl.create(:user, {:user_name => "cabby"})
	  user3 = FactoryGirl.create(:user, {:user_name => "babby"})
      get :index, {}, valid_session
      assigns(:users).should eq([user1, user3, user2])
	end
  end
  
  describe "GET Show method" do
    it "assigns one(id param)user as @user" do
      user = FactoryGirl.create(:user)
      get :show, {:id => user.id}, valid_session
	  #Do a get for the show method for this controller(UserController) ... in this case its the users
      assigns(:user).should eq(user)
	  #assigns ... assign instance variable @users ... review later
	end
  end
  describe "GET New method" do
    it "assigns a unsave user object as @user" do
      user = FactoryGirl.create(:user)
      get :new, {}, valid_session
	  assigns(:user).should be_a_new(User)
	  response.should render_template("new")
	  #Do a get for the new method for this controller(UserController) ... in this case its the users
	end
  end
  describe "GET Edit method" do
    it "assigns all users as @users" do
      user = FactoryGirl.create(:user)
      get :edit, {:id => user.id}, valid_session
	  #Do a get for the edit method for this controller(UserController) ... in this case its the users
      assigns(:user).should eq(user)
	  #assigns ... assign instance variable @users ... review later
	end
  end  
  describe "GET Delete method" do
    it "assigns all users as @users" do
      user = FactoryGirl.create(:user)
      get :destroy, {:id => user.id}, valid_session
	  #Do a get for the destory method for this controller(UserController) ... in this case its the users
      assigns(:user).should eq(user)
      user2 = User.find_by_id(user.id)
	  user2.should be_nil
	  #assigns ... assign instance variable @users ... review later
	end
  end  
  describe "GET Update method" do
  #move this above Delete ... This should be the Update test.  Find examples here and in device controller spec
    it "assigns all users as @users" do
      user = FactoryGirl.create(:user)
      get :destroy, {:id => user.id}, valid_session
	  #Do a get for the destory method for this controller(UserController) ... in this case its the users
      assigns(:user).should eq(user)
      user2 = User.find_by_id(user.id)
	  user2.should be_nil
	  #assigns ... assign instance variable @users ... review later
	end
  end  
end 
