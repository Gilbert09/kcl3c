class WizardController < ApplicationController

  def index
    json = params["data"]
    render :json => json
  end

  def draft
    if signed_in?
      api = ApiController.new
      api.saveDraft(params["data"], params["stage"])
    else
      render :json => '{ "Error": "User not authenticated - " }'
    end
  end
end
