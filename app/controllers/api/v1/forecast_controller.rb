class Api::V1::ForecastController < ApplicationController
  def index
    binding.pry
    render json: ForecastSerializer.new(params[:location])
  end
end
