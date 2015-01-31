class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.Integer :views
      t.String :visible
      t.String :dateListed
      t.String :dateSold
      t.timestamps null: false
    end
  end
end
