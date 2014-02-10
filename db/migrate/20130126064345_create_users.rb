class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_password
      t.string :user_type
      t.string :user_email

      t.timestamps
    end
  end
end
