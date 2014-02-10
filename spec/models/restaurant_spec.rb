require 'spec_helper'

describe Restaurant do

  it "has a valid factory" do
    FactoryGirl.create(:restaurant).should be_valid
	#validates that the restaurant table has been successfully populated based on ... confirm w/ Steve
  end
  it "when validation for invalid restaurant name occurs" do
    restaurant = FactoryGirl.build(:restaurant, {:restaurant_name => '' })
	restaurant.should_not be_valid
	#user.valid?.should == false  This is another option for the test above
  end
  it "when validation for valid restaurant name occurs" do
    restaurant = FactoryGirl.build(:restaurant, {:restaurant_name => 'Valid Restaurant Test' })
	restaurant.should be_valid
  end
  it "when validation for invalid restaurant city occurs" do
    restaurant = FactoryGirl.build(:restaurant, {:restaurant_city => 'GT25_012345678901234567890123456789' })
	restaurant.should_not be_valid
  end
  it "when validation for valid restaurant city occurs" do
    restaurant = FactoryGirl.build(:restaurant, {:restaurant_city => 'Valid City Test' })
	restaurant.should be_valid
  end
  it "when validation for invalid restaurant url occurs" do
    restaurant = FactoryGirl.build(:restaurant, {:restaurant_url => 'Invaild URL Test' })
	restaurant.should_not be_valid
  end
  it "when validation for valid restaurant url occurs" do
    restaurant = FactoryGirl.build(:restaurant, {:restaurant_url => 'http://www.thecounterburger.com' })
	restaurant.should be_valid
  end  
  	#Steve:  should I keep these separate or should I combine the two invalid/valid behaviors?
end
