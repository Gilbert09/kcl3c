class Room < ActiveRecord::Base
  belongs_to :property, inverse_of: :rooms
  has_many :multimedias
end
