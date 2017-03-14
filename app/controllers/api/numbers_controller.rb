class API::NumbersController < ApplicationController

  MAX_OFFSET = HUNDRED_BILLION = 100000000000
  MAX_LIMIT = 200

  # GET /numbers
  def index
    offset = params[:offset] ? params[:offset].to_i : 1
    limit = params[:limit] ? params[:limit].to_i : 100
    @numbers = Numbers.all(offset, offset + limit)

    render json: {
      "links": {
        "current": request.original_url
      },
      "data": @numbers
    }, status: 200
  end

  # GET /numbers/1
  def show
    render json: {
      "links": {
        "current": request.original_url
      },
      "data": Numbers.one(params[:id].to_i)
    }, status: 200
  end
end
