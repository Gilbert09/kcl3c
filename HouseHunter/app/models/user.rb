class User < ActiveRecord::Base

=begin
this class represents the model for users in the database. The user includes clearance meaning they have to be registered
before their details are stored in the database. A user can have many instances of properties. And a user can be searched
to find all of their properties.
=end

	include Clearance::User

	has_many :properties, inverse_of: :user
end
