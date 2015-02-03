class Multimedia < ActiveRecord::Base
  belongs_to :property, inverse_of: :multimedias
end
