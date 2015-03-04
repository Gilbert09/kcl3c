class User < ActiveRecord::Base
	include Clearance::User

	has_many :properties, inverse_of: :user

	
end
