class RightmoveController < ApplicationController
  @data = Hash.new

  def initialize(propertyData)
    @data.to_json
  end
end
