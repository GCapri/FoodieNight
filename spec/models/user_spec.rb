require 'spec_helper'

describe User do

  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
	#validates that content in the object that was created by the factory is valid as defined in the user model
  end
  it "when validation for invalid password occurs" do
    user = FactoryGirl.build(:user, {:user_password => 'one' })
	user.should_not be_valid
	#user.valid?.should == false  This is another option for the test above
  end
  it "when validation for valid password occurs" do
    user = FactoryGirl.build(:user, {:user_password => '12345678' })
	user.should be_valid
  end
  it "when validation for invalid email occurs" do
    user = FactoryGirl.build(:user, {:user_email => 'invalid email address' })
	user.should_not be_valid
  end
  it "when validation for valid email occurs" do
	user = FactoryGirl.build(:user, {:user_email => 'gcapriana@aol.com' })
	user.should be_valid
  end

    #We want to test   
  
  	#Steve:  should I keep these separate or should I combine the two behaviors?
	#Steve:  Should we add a case for user_type valid = user.  This can be done after the code is written 
	#in the user model
	#basic, boundary, logic, 

end
