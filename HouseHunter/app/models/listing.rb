class Listing < ActiveRecord::Base
  belongs_to :property, inverse_of: :listing
end
