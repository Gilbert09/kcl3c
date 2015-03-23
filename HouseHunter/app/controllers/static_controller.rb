class StaticController < ApplicationController

=begin
this class is the controller for all static pages of the website, this means they are the same throughout the website
and are not user specific.
=end

  # this method renders the index page.
  def index
    render 'index'
  end

  # this method renders the howitworks page.
  def howitworks
    render 'howitworks'
  end

  # this method renders the fees page.
  def fees
    render 'fees'
  end

  # this method renders the advice page.
  def advice
    render 'advice'
  end

  # this method renders the FAQs page.
  def faq
    render 'faq'
  end

  # this method renders the about page.
  def about
    render 'about'
  end

  # this method renders the contact page.
  def contact
    render 'contact'
  end

  # this methods renders the terms page.
  def terms
    render 'terms'
  end

  # this method renders the cookies page.
  def cookie
    render 'cookies'
  end

  # this method renders the listings page, showing the user all of the properties which are listed on the website.
  def listing
    if Property.exists?(params[:id]) then
      @listing = Property.find(params[:id])
      render 'listing'
    else
      redirect_to action: 'index'
    end
  end
end
