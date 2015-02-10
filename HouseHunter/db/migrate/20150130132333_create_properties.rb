class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.integer :price
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.integer :number_of_receptions
      t.string :kitchen_type
      t.string :keyword
      t.string :property_type
      t.string :status
      t.string :parking
      t.string :outdoor_spaces
      t.text :description
      t.timestamps null: false
    end
  end
end
