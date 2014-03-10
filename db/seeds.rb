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
   
#      #. need to do the update to get the file back to the original state
#      #. need to also do something to delete extra data to ensure the file is returned to original state
#      #. include all user data that represents the seeded file and flag them
#      #. when you run the seed file delete everything that was flagged
#      t.string :user_name
#      t.string :user_password
#      t.string :user_type
#      t.string :user_email

