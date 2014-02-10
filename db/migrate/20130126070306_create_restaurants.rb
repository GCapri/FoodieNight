class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :restaurant_city
      t.string :restaurant_url

      t.timestamps
    end
  end
end
