class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(ForecastFacade.new(params[:location]).get_coordinates)
  end
end
