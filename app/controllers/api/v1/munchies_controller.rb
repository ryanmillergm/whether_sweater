class Api::V1::MunchiesController < ApplicationController
  def index

    response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood&key=AIzaSyDXJ9V7QreVlZEn-EPF4yMOrUCFrv4xdow")

    binding.pry
    JSON.parse(response.body, symbolize_names: true)
    params[:start]
    params[:end]
    params[:food]


  end
end
