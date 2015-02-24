class WizardController < ApplicationController
  def index
    json = params["data"]
    render :json => json
  end
end
