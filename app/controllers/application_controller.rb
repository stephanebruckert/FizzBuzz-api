class ApplicationController < ActionController::Base
  include ActionController::ImplicitRender
  include ActionController::MimeResponds

  def cors_preflight_check
    headers['Access-Control-Max-Age'] = '1728000'

    render json: {} # Render as you need
  end

  def render_json_error(status, error_code, extra = {})
    status = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a? Symbol

    error = {
      title: I18n.t("error_messages.#{error_code}.title"),
      status: status,
      code: I18n.t("error_messages.#{error_code}.code")
    }.merge(extra)

    detail = I18n.t("error_messages.#{error_code}.detail", default: '')
    error[:detail] = detail unless detail.empty?

    render json: { error: error }, status: status
  end
end
