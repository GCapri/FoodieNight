class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates_numericality_of :my_rating, :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5, :allow_nil => true
  validates_presence_of :user_id
  validate :user_exists
  validates_presence_of :restaurant_id
  validate :restaurant_exists
  
  def self.scope_restaurant_id(rest_id)
    where(:restaurant_id => rest_id)
  end
  
  def self.scope_user_id(u_id)
    where(:user_id => u_id)
  end
  
  def self.value_mapping
    return [['Good', 1], ['Ok', 2], ['Sad', 3]]
	return [['Good', 1], ['Ok', 2], ['Sad', 3]]
	
  end
  
# When a new row is created in the Ratings Table
# Get Restaurant_ID and My_Rating_Value
# Add My_Rating_Value to Total_Rating_Value for that Restaurant_ID
# 
  def self.ranking_value
# This method is going loop over all the ratings rows for a given restaurant_ID and sum up and return 
# Rating.sum("my_ratings").where(restaurant_id: '(variable)'
    
#   results = Rating.sum("my_rating")  * This will return the total rating value of all restaurants
#   results = Rating.where(:restaurant_id => '3').sum("my_rating") * This will return the total rating value for restaurant_id 3
    results = Rating.scope_restaurant_id(2).sum("my_rating")

    return results
	  
#values = Meter.sum(:value, :group => :read_time)
#values.each do |read_time, value|
#  aggregate_meter = Meter.new(:read_time => read_time, :value => value, :resource_id => 3)
#  @aggregates_meter.push(aggregate_meter)
#end	
	
	
	
  end
  
  protected
  
  def user_exists
    errors.add(:user_id, "doesn't exist") unless User.exists?(user_id)
	#validates that the userid is valid, meaning refers to the user table in the db to validate that userid exists
  end
  
  def restaurant_exists
    errors.add(:restaurant_id, "doesn't exist") unless Restaurant.exists?(restaurant_id)
	#validates that the restaurant_id is valid, meaning refers to the user table in the db to validate that rest..id exists
  end
end
