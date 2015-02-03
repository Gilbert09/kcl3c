class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :property_id
      t.integer :views
      t.boolean :visible
      t.timestamps :dateListed
      t.timestamps :dateSold
      t.timestamps null: false
    end
  end
end
