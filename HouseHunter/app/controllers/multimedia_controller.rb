class MultimediaController < ApplicationController

=begin
this class represents the controller for all the media such as images a user uploads to the website, it inherits all
the methods of the ApplicationController class.
=end

  # this method retrieves the images a user has uploaded for a property.
  def show
    @multimedia = Multimedia.find(params[:id])
  end

  # this method indexes all of the images a user has uploaded for a property.
  def index
    @multimedias = Multimedia.all
  end

  # this method is called when a new image is uploaded by a user.
  def new
    @multimedia = Multimedia.new
  end

  # this method is called when the image has been uploaded and saves the image into the database.
  def create
    @multimedia = Multimedia.new
    if @multimedia.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  # this method is called when a user wants to edit an image for a property.
  def edit
    @multimedia = Multimedia.find(params[:id])
  end

  # this method is called when a user has chanegd an image for a property and then replaces the old image in the database with the new one.
  def update
    @multimedia = Multimedia.find(params[:id])
    if @multimedia.update_attributes(@multimedia_params)
      redirect_to(:action => 'show', :id => @multimedia.id)
    else
      render('index')
    end
  end

  # this method is called when a user wants to delete an image for a property.
  def delete
    @multimedia = Multimedia.find(params[:id])
  end

  # this method is called when a user has deleted an image, it updates the database by removing this image.
  def destroy
    @multimedia = Multimedia.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  # methods below this line are all private.
  private

  # this method identifies what is required in order to access any of the methods above.
  def property_params
    params.require(:multimedia).permit(:index_number, :multimedia_type, :name, :caption, :data)
  end
end
