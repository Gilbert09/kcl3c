class Address < ActiveRecord::Base
  belongs_to :property, inverse_of: :address
end
