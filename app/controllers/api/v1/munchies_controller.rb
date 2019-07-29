class Api::V1::MunchiesController < ApplicationController
  def index
    render json: MunchiesSerializer.new(RestaurantFinderFacade.new(munchies_params))


    # google_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood&key=AIzaSyDXJ9V7QreVlZEn-EPF4yMOrUCFrv4xdow")
    #https://maps.googleapis.com/maps/api/directions/json?origin=denver,co&destination=pueblo,co&key=AIzaSyDXJ9V7QreVlZEn-EPF4yMOrUCFrv4xdow
    # travel_time = JSON.parse(google_response.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:text].split.first.to_i
    # travel_time_interval_type = JSON.parse(google_response.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:text].split[1]
    #
    #
    # params[:start]
    # params[:end]
    # params[:food]
    #
    # yelp_response = Faraday.get("https://api.yelp.com/v3/businesses/search?location=pueblo,co&term=food&categories=chinese&open_at=1564419210&imit=3") do |f|
    #   f.headers = { Authorization: "Bearer #{ENV["YELP_API_KEY"]}" }
    #   end
    # results = JSON.parse(yelp_response.body, symbolize_names: true)[:businesses]
    #
    # @restaurants = results.each do |result|
    #   Restaurant.new(result)
    # end
    binding.pry
  end

  private

  def munchies_params
    params.permit(:start, :end, :food)
  end
end
