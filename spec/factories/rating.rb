require 'faker'

FactoryGirl.define do
  factory :rating do |rating|
    rating.my_rating {1}
	association :restaurant_id, :factory => :restaurant
	association :user_id, :factory => :user
  end
end