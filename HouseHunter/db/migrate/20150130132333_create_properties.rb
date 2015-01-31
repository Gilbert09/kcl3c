class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :price
      t.integer :numberBedroom
      t.integer :numberBathroom
      t.integer :numberRoom
      t.string :keyword
      t.string :description
      t.string :type
      t.timestamps null: false
    end
  end
end
