class CreateMultimedia < ActiveRecord::Migration

=begin
this class represents the database migration of multimedia.
=end

  # this method shows all of the fields associated with the multimedia relation in the database and their data types to go with.
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
