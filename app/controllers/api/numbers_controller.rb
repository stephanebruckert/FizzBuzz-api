class API::NumbersController < ApplicationController

  MAX_OFFSET = HUNDRED_BILLION = 100000000000
  MAX_LIMIT = 200

  # GET /numbers
  def index
    offset = params[:offset] ? params[:offset].to_i : 1
    limit = params[:limit] ? params[:limit].to_i : 100
    @numbers = Numbers.all(offset, offset + limit - 1)
    render json: @numbers, each_serializer: NumbersSerializer, status: 200
  end

end
