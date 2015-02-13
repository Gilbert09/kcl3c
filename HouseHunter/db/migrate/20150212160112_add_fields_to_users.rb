class AddFieldsToUsers < ActiveRecord::Migration
  def change
	add_column :users, :first_name, :string
	add_column :users, :last_name, :string
	add_column :users, :title, :string
	add_column :users, :mobile_number, :integer
	add_column :users, :home_number, :integer
  end
end
