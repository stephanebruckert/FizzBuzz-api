class API::NumbersController < ApplicationController
  include NumbersHelper

  # GET /numbers
  def index
    begin
      offset = validate_offset(params[:offset])
      limit = validate_limit(params[:limit])
      check_boundaries(offset + limit - 1)
    rescue Exception => type
      render_json_error 400, type
      return
    end

    @numbers = Numbers.all(offset, offset + limit - 1)
    render json: @numbers, each_serializer: NumbersSerializer, status: 200
  end

end
