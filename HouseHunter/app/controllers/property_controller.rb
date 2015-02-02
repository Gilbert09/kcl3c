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

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(property_params)
      redirect_to(:action => 'show', :id => @property.id)
    else
      render('index')
    end
  end

  # these methods (delete && destroy) below may be deleted depending on client requests.
  def delete
    @property = Property.find(params[:id])
  end

  def destroy
    @property = Property.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private
  def property_params
    params.require(:property).permit(:price, :numberBedroom, :numberBathroom, :numberRoom, :keyword, :description, :type)
  end
end
