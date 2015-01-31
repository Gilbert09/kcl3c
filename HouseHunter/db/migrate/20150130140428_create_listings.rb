class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :views
      t.string :visible
      t.string :dateListed
      t.string :dateSold
      t.timestamps null: false
    end
  end
end
