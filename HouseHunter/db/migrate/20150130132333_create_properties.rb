class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.Integer :propertyId
      t.Integer :price
      t.Integer :numberBedroom
      t.Integer :numberBathroom
      t.Integer :numberRoom
      t.String :keyword
      t.String :description
      t.String :type
      t.timestamps null: false
    end
  end
end
