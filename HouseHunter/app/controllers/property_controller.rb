class PropertyController < ApplicationController
  def show
  end

  def index
  end

  private
  def property_params
    params.require(:property).permit(:price, :numberBedroom, :numberBathroom, :numberRoom, :keyword, :description, :type)
  end
end
