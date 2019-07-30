class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: road_trip_params[:api_key])
    if user.nil?
      render json: { message: "credentials were bad" }, status: 401
    else
      render json: RoadTripSerializer.new(RoadTripFacade.new(road_trip_params))
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
