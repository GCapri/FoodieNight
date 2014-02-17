# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#  
# Examples:
#   
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# Example2 from the Rails Guide
#
#   Client.find_or_create_by(first_name: 'Andy')
#
   user = User.find_or_create_by_user_name('AUserName', 
   {:user_password => 'apass6789', :user_type => 'user', :user_email => 'ausername@gamil.com'})
     user = User.find_or_create_by_user_name('BUserName', 
   {:user_password => 'bpass1111', :user_type => 'user', :user_email => 'busername@gamil.com'})
#
#      t.string :user_name
#      t.string :user_password
#      t.string :user_type
#      t.string :user_email

