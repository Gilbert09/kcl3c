class AccountController < ApplicationController

=begin
this class represents the controller for the users account page on the website, users must be logged in before having
access to these methods because they are unique to every single user.
=end

  before_action :require_login 
  skip_before_filter :verify_authenticity_token, :only => [:editDetails, :saveDetails]

  # this method automatically executes the createListing method below.
  def account
    redirect_to action: 'createListing'
  end

  # this method when called will guide the user to create a listing.
  def createListing
    render 'account/create'
  end

  # this method when called shows the user their currently incomplete listings.
  def incompleteListings
    @properties = current_user.properties.where("status = 'incomplete'")
    render 'account/incomplete'
  end

  # this method when called shows the user their currently complete listings.
  def activeListings
    @properties = current_user.properties.where("status = 'active'")
    render 'account/active'
  end

  # this method when called shows the user their listings which have been completed but are not listed online.
  def inactiveListings
    @properties = current_user.properties.where("status = 'inactive'")
    render 'account/inactive'
  end

  # this method when called shows the user their account details.
  def details
    render 'account/details'
  end

  # this method when called shows the user their account details and allows them to edit them.
  def editDetails
    render 'account/editdetails'
  end

  # this method when called saves the details the user has entered and checks to see if the user has entered a valid password.
  def saveDetails
    if params["password"] != params["confirm_password"] then
      flash[:error] = "Passwords do not match"
      render 'account/editDetails'
    else
      current_user.first_name = params["first_name"]
      current_user.last_name = params["last_name"]
      if params["password"] != "" and params["password"] != nil then current_user.update_password params["password"] end
      current_user.email = params["email"]
      current_user.phone_number = params["phone_number"]
      current_user.save
      redirect_to action: 'details'
    end
  end

  # this method hides the listing of a users property.
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

  # this method shows the listing of a users property.
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

  # this method allows the user to edit an existing listing.
  def editListing
  	render 'account/wizard'
  end

  def newListing
  	property = Property.new
	property.user_id = current_user.id
    property.status = "incomplete"
    property.save
    redirect_to action: 'editListing', id: property.id
  end

  # this method is called when a user exits the wizard before finishing a listing allowing them to come back and complete it later.
  def saveWizard
    if signed_in?
      api = ApiController.new
      result = api.saveDraft(JSON.parse(params["data"])["data"], params["stage"], current_user, params["id"])
      render :json => result
    else
      render :json => '{ "status": "Error", "message": "User not authenticated" }'
    end
  end

  # this method allows the user to sign out of their account from the accounts page of the website.
  def signout
    sign_out
    cookies.delete(:remember_token)
    redirect_to controller: 'static', action: 'index'
  end
end
