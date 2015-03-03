class User < ActiveRecord::Base
  has_many :properties, inverse_of: :user
	
	# validates :first_name, presence: true
	# validates :last_name, presence: true
	# validates :phone_number, presence: true
	# validates :title, presence: true
end
