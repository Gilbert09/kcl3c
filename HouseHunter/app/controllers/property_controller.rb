class PropertyController < ApplicationController
  def show
    @property = Property.find(params[:id])
  end

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new
    if @property.save
      redirect_to(:action => 'index')
    else
      render ('new')
    end
  end

  private
  def property_params
    params.require(:property).permit(:price, :numberBedroom, :numberBathroom, :numberRoom, :keyword, :description, :type)
  end
end
