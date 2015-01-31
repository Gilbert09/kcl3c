class CreateMultimedia < ActiveRecord::Migration
  def change
    create_table :multimedia do |t|
      t.String :type
      t.String :name
      t.Object :data
      t.timestamps null: false
    end
  end
end
