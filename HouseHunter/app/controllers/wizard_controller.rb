class WizardController < ApplicationController

  def index
    json = params["data"]
    render :json => json
  end

  def draft
    if signed_in?
      api = ApiController.new
      result = api.saveDraft(JSON.parse(params["data"])["data"], params["stage"], current_user)
      render :json => result
    else
      render :json => '{ "status": "Error", "message": "User not authenticated" }'
    end
  end
end
