class CreateMultimedia < ActiveRecord::Migration
  def change
    create_table :multimedia do |t|
      t.integer :property_id
      t.integer :room_id
      t.integer :index_number
      t.string :multimedia_type
      t.string :name
      t.string :caption
      t.binary :data
      t.timestamps null: false
    end
  end
end
