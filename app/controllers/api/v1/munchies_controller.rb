class Api::V1::MunchiesController < ApplicationController
  def index

    google_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood&key=AIzaSyDXJ9V7QreVlZEn-EPF4yMOrUCFrv4xdow")

    travel_time = JSON.parse(google_response.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:text].split.first.to_i
    travel_time_interval_type = JSON.parse(google_response.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:text].split[1]

    yelp_response = Faraday.get()
    binding.pry
    params[:start]
    params[:end]
    params[:food]


  end
end
