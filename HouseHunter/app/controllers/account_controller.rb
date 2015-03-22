class AccountController < ApplicationController

  before_action :require_login

  def account
    redirect_to action: 'createListing'
  end

  def createListing
    render 'account/create'
  end

  def incompleteListings
    @properties = current_user.properties.where("status = 'incomplete'")
    render 'account/incomplete'
  end

  def activeListings
    @properties = current_user.properties.where("status = 'active'")
    render 'account/active'
  end

  def inactiveListings
    @properties = current_user.properties.where("status = 'inactive'")
    render 'account/inactive'
  end

  def details
    render 'account/details'
  end

  def editDetails
    render 'account/editdetails'
  end

  def hideListing
  	id = params[:id]
  	if current_user.properties.exists?(id) then
  		p = current_user.properties.find(id)
  		p.status = "inactive"
  		p.save
  		redirect_to action: 'activeListings'
  	else
  		redirect_to action: 'activeListings'
  	end
  end

  def showListing
  	id = params[:id]
  	if current_user.properties.exists?(id) then
  		p = current_user.properties.find(id)
  		p.status = "active"
  		p.save
  		redirect_to action: 'inactiveListings'
  	else
  		redirect_to action: 'inactiveListings'
  	end
  end

  def signout
    sign_out
    cookies.delete(:remember_token)
    redirect_to action: 'index'
  end
end
