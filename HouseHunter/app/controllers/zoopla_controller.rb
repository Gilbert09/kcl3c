class ZooplaController < ApplicationController

=begin
this class is the controller for the Rightmove API.
=end

  @data = Hash.new

  # this method initializes the class and takes in the data of a property and converts it to a json data format.
  def initialize(propertyData)
    @data.to_json
  end
end
