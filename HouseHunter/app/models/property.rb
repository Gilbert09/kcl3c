class Property < ActiveRecord::Base

=begin
this class defines the model for properties in the database. Every instance of a property belongs to a user, has ownership
over many instances of multimedia, has many instances of rooms and has one listing and address.
=end

  belongs_to :user, inverse_of: :properties
  has_many :multimedias
  has_many :rooms
  has_one :listing
  has_one :address
end
