class WizardController < ApplicationController
  before_action :authenticate_user!

  @apicontroller = ApiController.new

  def index
    json = params["data"]
    render :json => json
  end

  def draft
    if user_signed_in?
      @apicontroller.saveDraft(params["data"])
    else
      render :json => '{ "error": "user not authenticated" }'
    end
  end
end
