class User < ActiveRecord::Base
	has_many :properties, inverse_of: :user

	include Clearance::User
end
