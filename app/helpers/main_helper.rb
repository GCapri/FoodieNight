module MainHelper
  def get_rating_value_for_restaurant(restaurant)
	rating = Rating.scope_restaurant_id(restaurant.id).scope_user_id(@current_user.id).first
	#Scope is used to filter the rows in the db based on the variables passed
	#Retrieves rating value(if any) for the current user and restaurant id that exists in the rating table
	#This code will return nil if there isn't a rating for a specific restaurant ID
	if rating
	# if rating is not nil
	  return rating.my_rating
	else
	  return nil
	  #This will be returned in the event that nil is returned.  This object will be in memory
	end	
  end
  def get_rating_for_restaurant(restaurant)
    rating = Rating.scope_restaurant_id(restaurant.id).scope_user_id(@current_user.id).first
    #Scope is used to filter the rows in the db based on the variables passed
    #Retrieves rating value(if any) for the current user and restaurant id that exists in the rating table
    #This code will return nil if there isn't a rating for a specific restaurant ID
    if rating
      # if rating is not nil then return rating object
      return rating
    else
      return Rating.create ({:restaurant_id => restaurant.id,:user_id => @current_user.id})
      #This will be returned in the event that nil is returned.  This object will be saved to the database
	  #This is the create model object
    end
  end
end
