class Property < ActiveRecord::Base
  has_many :multimedias
  has_one :listing
  has_one :address
  belongs_to :user
end
