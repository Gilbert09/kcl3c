class Users < ActiveRecord::Migration

=begin
this class represents the database migration of users.
=end

  # this method shows all of the fields associated with the user relation in the database and their data types to go with.
  def change
	create_table :users do |t|
		t.string :first_name
		t.string :last_name
		t.string :phone_number
	end
  end
end
