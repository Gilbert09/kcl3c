class WizardController < ApplicationController

  def index
    json = params["data"]
    render :json => json
  end

  def draft
    if signed_in?
      api = ApiController.new
      result = api.saveDraft(JSON.parse(params["data"])["data"], params["stage"])
      render :json => '{ "status": "Complete - ' + result + '"}'
    else
      render :json => '{ "Error": "User not authenticated - " }'
    end
  end
end
