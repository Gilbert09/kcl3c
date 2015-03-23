class CreateProperties < ActiveRecord::Migration

=begin
this class represents the database migration of the properties.
=end

  # this method shows all of the fields associated with the property relation in the database and their data types to go with.
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.integer :address_id
      t.integer :price
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.integer :number_of_receptions
      t.integer :number_of_other_rooms
      t.integer :number_of_floors
      t.integer :entrance_floor
      t.string :kitchen_type
      t.string :keyword
      t.string :property_type
      t.string :status
      t.string :parking
      t.string :outdoor_space
      t.string :condition
      t.string :heating
      t.text :description
      t.timestamps null: false
    end
  end
end
