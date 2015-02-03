class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :property_id
      t.string :addressLine1
      t.string :addressLine2
      t.string :townCity
      t.string :postCode
      t.string :county
      t.string :country
      t.timestamps null: false
    end
  end
end
