class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :my_ranking_value
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
