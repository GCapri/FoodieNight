class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :event_date
      t.datetime :deadline_date
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
