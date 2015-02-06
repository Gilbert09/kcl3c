class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :property_id
      t.string :address_line_1
      t.string :address_line_2
      t.string :town_city
      t.string :post_code
      t.string :county
      t.string :country
      t.timestamps null: false
    end
  end
end
