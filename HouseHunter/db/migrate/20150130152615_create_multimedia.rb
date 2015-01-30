class CreateMultimedia < ActiveRecord::Migration
  def change
    create_table :multimedia do |t|

      t.timestamps null: false
    end
  end
end
