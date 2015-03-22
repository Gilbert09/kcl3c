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

  def editListing
  	render 'wizard/wizard'
  end

  def newListing
  	property = Property.new
	property.user_id = current_user.id
    property.status = "incomplete"
    property.save
    redirect_to action: 'editListing', id: property.id
  end

  def saveWizard
    if signed_in?
      api = ApiController.new
      result = api.saveDraft(JSON.parse(params["data"])["data"], params["stage"], current_user)
      render :json => result
    else
      render :json => '{ "status": "Error", "message": "User not authenticated" }'
    end
  end

  def signout
    sign_out
    cookies.delete(:remember_token)
    redirect_to action: 'index'
  end
end
