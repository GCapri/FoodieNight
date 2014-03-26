class Restaurant < ActiveRecord::Base
  has_many :ratings
  validates_length_of :restaurant_name, :within => 1..25
  validates_length_of :restaurant_city, :within => 1..25 
  validates_format_of :restaurant_url, :with =>  /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix

   def get_rating_value_for_restaurant
	rating = Rating.scope_restaurant_id(self.id).scope_user_id(current_user.id).first
	#Scope is used to filter the rows in the db based on the variables passed
	#Retrieves rating value(if any) for the current user and restaurant id that exists in the rating table
	#This code will return nil if there isn't a rating for a specific restaurant ID
	if rating
	# if rating is not nil
	  return rating.my_rating
	else
	  return nil
	  #This will be returned in the event that nil is returned.  This object will be in memory
	  #Latest Update ... not using this code at this time 12/14
	end	 
   end
	
   def self.order_by_restaurant_name
	  return Restaurant.order('restaurant_name')
	end
end
