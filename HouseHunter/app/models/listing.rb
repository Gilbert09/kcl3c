class Listing < ActiveRecord::Base

=begin
this class defines the model for the listings in the database. It belongs to a property and again is reversible so
a user can find a listing through a property.
=end

  belongs_to :property, inverse_of: :listing
end
