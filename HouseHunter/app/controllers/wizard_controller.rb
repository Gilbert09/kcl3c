class WizardController < ApplicationController

  def index
    json = params["data"]
    render :json => json
  end

  def draft
    if user_signed_in?
      api = ApiController.new
      api.saveDraft(params["data"])
    else
      render :json => '{ "error": "user not authenticated" }' + user_signed_in?.to_s
    end
  end
end
