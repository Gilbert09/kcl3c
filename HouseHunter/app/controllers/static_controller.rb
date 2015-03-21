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
    render 'cookie'
  end

  def account
    redirect_to action: 'createListing'
  end

  def createListing
    render 'account/create'
  end

  def incompleteListings
    render 'account/incomplete'
  end

  def activeListings
    render 'account/active'
  end

  def inactiveListings
    render 'account/inactive'
  end

  def details
    render 'account/details'
  end

  def editDetails
    render 'account/editdetails'
  end
end
