class StaticController < ApplicationController

  def index
    render 'index'
  end

  def howitworks
    render 'howitworks'
  end

  def fees
    render 'fees'
  end

  def advice
    render 'advice'
  end

  def faq
    render 'faq'
  end

  def about
    render 'about'
  end

  def contact
    render 'contact'
  end

  def terms
    render 'terms'
  end

  def cookie
    render 'cookies'
  end

  def listing
    if Property.exists?(params[:id]) then
      @listing = Property.find(params[:id])
      render 'listing'
    else
      redirect_to action: 'index'
    end
  end
end
