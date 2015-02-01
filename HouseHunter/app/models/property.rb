class Property < ActiveRecord::Base
  has_many :multimedias
  has_one :listing
  belongs_to :user
end
