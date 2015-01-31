class CreateMultimedia < ActiveRecord::Migration
  def change
    create_table :multimedia do |t|
      t.string :type
      t.string :name
      t.binary :data
      t.timestamps null: false
    end
  end
end
