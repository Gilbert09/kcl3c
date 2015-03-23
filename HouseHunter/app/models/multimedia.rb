class Multimedia < ActiveRecord::Base

=begin
this class defines the model for multimedia in the database. Multimedia belongs to property and also a room this allowed
us to add room specific media or property specific media.
=end

  belongs_to :property, inverse_of: :multimedias
  belongs_to :room, inverse_of: :multimedias
end
