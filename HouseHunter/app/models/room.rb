class Room < ActiveRecord::Base

=begin
this class defines the model for room in the database. A room belongs to a property and can have many instances of multimedia.
=end

  belongs_to :property, inverse_of: :rooms
  has_many :multimedias
end
