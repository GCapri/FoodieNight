class User < ActiveRecord::Base
  has_many :ratings
  validates_length_of :user_name, :within => 1..25
  validates_length_of :user_password, :within => 8..15
  #validate that user type to be admin or user
  
  #validate valid email address format
  validates_format_of :user_email, :with => /^[-_a-z0-9\'+*$^&%=~!?{}]++(?:\.[-_a-z0-9\'+*$^&%=~!?{}]+)*+@(?:(?![-.])[-a-z0-9.]+(?<![-.])\.[a-z]{2,6}|\d{1,3}(?:\.\d{1,3}){3})(?::\d++)?$/i
end
