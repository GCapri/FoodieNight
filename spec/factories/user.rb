require 'faker'

FactoryGirl.define do
  factory :user do |user|
    user.user_name {'Lisa Durham'}
	user.user_password {'password01'}
	user.user_type {'user'}
	user.user_email {'lisa@gmail.com'}
  end
end