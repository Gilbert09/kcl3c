class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.String :addressLine1
      t.String :addressLine2
      t.String :townCity
      t.String :postCode
      t.String :county
      t.timestamps null: false
    end
  end
end
