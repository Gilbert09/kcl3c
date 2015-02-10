class MultimediaController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new
    if @room.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      redirect_to(:action => 'show', :id => @room.id)
    else
      render('index')
    end
  end

  def delete
    @room = Room.find(params[:id])
  end

  def destroy
    @room = Room.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private
  def property_params
    params.require(:multimedia).permit(:index_number, :multimedia_type, :name, :caption, :data)
  end
end
