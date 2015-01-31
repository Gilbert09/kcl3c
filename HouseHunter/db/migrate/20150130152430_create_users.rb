class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.Integer :userId
      t.String :firstName
      t.String :lastName
      t.String :password
      t.String :title
      t.String :email
      t.timestamps null: false
    end
  end
end
