class Address < ActiveRecord::Base

=begin
this class defines the model for addresses in the database, it creates the relations that define the address
the address field belongs has a property and is reversible meaning you can find a property by looking for an address.
=end

  belongs_to :property, inverse_of: :address
end
