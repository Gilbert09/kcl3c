require 'json'

class Rightmove
  @jsonData = Hash.new {|hash, key|}

  def initialize(propertyData)
    @jsonData.to_json
  end
end