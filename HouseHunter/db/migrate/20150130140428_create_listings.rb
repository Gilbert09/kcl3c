class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :property_id
      t.integer :views
      t.boolean :visible
      t.timestamps :date_listed
      t.timestamps :date_sold
      t.timestamps null: false
    end
  end
end
