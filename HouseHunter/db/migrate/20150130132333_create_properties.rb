class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.integer :price
      t.integer :number_bedroom
      t.integer :number_bathroom
      t.integer :number_reception
      t.string :keyword
      t.string :description
      t.string :property_type
      t.string :status
      t.string :parking
      t.string :outdoor_spaces
      t.timestamps null: false
    end
  end
end
