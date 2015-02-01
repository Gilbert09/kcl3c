class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :property_id
      t.string :firstName
      t.string :lastName
      t.string :password
      t.string :title
      t.string :email
      t.timestamps null: false
    end
  end
end
