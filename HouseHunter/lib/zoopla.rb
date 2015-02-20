require 'json'

class Zoopla
  @propertyData = Hash.new {|hash, key|}
  
  def initialize
    @propertyData.to_json
  end

end