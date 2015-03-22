class StaticController < ApplicationController

  before_action :require_login, only: [:account, :createListing, :incompleteListings, :activeListings, :inactiveListings, :details, :editDetails]

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
    @properties = current_user.properties
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

  def signout
    sign_out
    cookies.delete(:remember_token)
    redirect_to action: 'index'
  end
end
