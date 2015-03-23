class PropertyController < ApplicationController

=begin
this class is a controller for any properties which are uploaded to the website, this class requires authorization in
order to use as we need to ensure that a user can only manage their own properties, it inherits all the methods of the
 ApplicationController class.
=end

  before_filter :authorize


  # this method is called when a user wants to view all of their properties, it makes a call to the database to find the users properties.
  def show
    @property = Property.find(params[:id])
  end

  # this method shows the user all of their properties.
  def index
    @properties = Property.all
  end

  # this method is called when a user wants to add a new property.
  def new
    @property = Property.new
  end

  # this method is called when a user has created a new property, it saves the property in the database.
  def create
    @property = Property.new
    if @property.save
      redirect_to(:action => 'index')
    else
      render ('new')
    end
  end

  # this method is called when a user wants to edit a property.
  def edit
    @property = Property.find(params[:id])
  end

  # this method is called when a user has finished editing a property, it saves the updated details in the database.
  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(property_params)
      redirect_to(:action => 'show', :id => @property.id)
    else
      render('index')
    end
  end

  # this method is called when a user makes a request to delete a property, it fetches the property from the database.
  def delete
    @property = Property.find(params[:id])
  end

  # this method is called when a user deletes a property, it removes the property from the database.
  def destroy
    @property = Property.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  # this method identifies what is required in order to access any of the methods above.
  private
  def property_params
    params.require(:property).permit(:price, :numberBedroom, :numberBathroom, :numberRoom, :keyword, :description, :type)
  end
end
