class Api::V1::MunchiesController < ApplicationController
  def index
    render json: MunchiesSerializer.new(RestaurantFinderFacade.new(munchies_params))
  end

  private

  def munchies_params
    params.permit(:start, :end, :food)
  end
end
