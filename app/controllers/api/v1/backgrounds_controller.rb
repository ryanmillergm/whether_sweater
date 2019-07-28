class Api::V1::BackgroundsController < ApplicationController
  def index
    render JSON: BackgroundsSerializer.new(BackgroundsFacade.new(params[:location]))
  end
end
