class CreateListings < ActiveRecord::Migration

=begin
this class represents the database migration of listings.
=end

  # this method shows all of the fields associated with the listings relation in the database and their data types to go with.
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
