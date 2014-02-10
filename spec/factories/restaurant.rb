require 'faker'

FactoryGirl.define do
  factory :restaurant do |restaurant|
    restaurant.restaurant_name {'The Counter'}
	restaurant.restaurant_city {'Palo Alto'}
	restaurant.restaurant_url {'http://www.thecounterburger.com/'}
  end
end