class MultimediaController < ApplicationController
  def show
    @multimedia = Multimedia.find(params[:id])
  end

  def index
    @multimedias = Multimedia.all
  end

  def new
    @multimedia = Multimedia.new
  end

  def create
    @multimedia = Multimedias.new
    if @multimedia.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @multimedia = Multimedia.find(params[:id])
  end

  def update
    @multimedia = Multimedia.find(params[:id])
    if @multimedia.update_attributes(@multimedia_params)
      redirect_to(:action => 'show', :id => @multimedia.id)
    else
      render('index')
    end
  end

  def delete
    @multimedia = Multimedia.find(params[:id])
  end

  def destroy
    @multimedia = Multimedia.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private
  def property_params
    params.require(:multimedia).permit(:index_number, :multimedia_type, :name, :caption, :data)
  end
end
