class ApplicationController < ActionController::Base
  include ActionController::ImplicitRender
  include ActionController::MimeResponds

  def cors_preflight_check
    headers['Access-Control-Max-Age'] = '1728000'

    render json: {} # Render as you need
  end
end
