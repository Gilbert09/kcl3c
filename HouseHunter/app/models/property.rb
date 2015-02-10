class Property < ActiveRecord::Base
  belongs_to :user, inverse_of: :properties
  has_many :multimedias
  has_many :rooms
  has_one :listing
  has_one :address
end
