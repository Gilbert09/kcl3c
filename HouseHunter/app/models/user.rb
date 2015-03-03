class User < ActiveRecord::Base
  has_many :properties, inverse_of: :user
  authenticates_with_sorcery!
  
end
