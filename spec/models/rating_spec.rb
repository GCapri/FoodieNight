require 'spec_helper'

describe Rating do

# The GetRestaurantID method hasn't been completed in the Ratings Class

  it "has a valid factory" do
    FactoryGirl.create(:rating).should be_valid
	#validates that the rating table has been successfully populated based on the definition of the spec under factory... talk with Steve
  end
  it "when validation for invalid rating occurs" do
    rating = FactoryGirl.build(:rating, {:my_rating => 0 })
	rating.should_not be_valid
    #rating = FactoryGirl.build(:rating, {:my_rating => 6 }) added two behaviors within the "it"?  
	rating.should_not be_valid
	#rating.valid?.should == false  This is another option for the test above
  end	
  it "when validation for valid rating occurs" do
    rating = FactoryGirl.build(:rating, {:my_rating => 1 })
	rating.should be_valid
    #rating = FactoryGirl.build(:rating, {:my_rating => 5 }) added two behaviors within the "it"?  
	#rating.should_not be_valid
  end	
  it "validation when user_id doesn't exist" do
	rating = FactoryGirl.build(:rating, {:user_id => 'gcapriana@aol.com' })
	rating.should_not be_valid
  end
  it "validation when user_id doesn't exist" do
	rating = FactoryGirl.build(:rating, {:user_id => 13 })
	rating.should_not be_valid
# Add tests for the restaurant id	
  end
end
  
