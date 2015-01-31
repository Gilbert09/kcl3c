class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :addressLine1
      t.string :addressLine2
      t.string :townCity
      t.string :postCode
      t.string :county
      t.timestamps null: false
    end
  end
end
