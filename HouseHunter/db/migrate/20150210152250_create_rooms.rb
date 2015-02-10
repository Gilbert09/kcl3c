class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :property_id
      t.integer :multimedia_id
      t.float :room_length
      t.float :room_width
      t.string :room_type
      t.string :measurement_unit
      t.text :description
      t.timestamps null: false
    end
  end
end
