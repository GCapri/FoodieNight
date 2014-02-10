class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates_numericality_of :my_rating, :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5
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
