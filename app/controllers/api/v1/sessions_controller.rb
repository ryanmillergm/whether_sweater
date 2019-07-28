class Api::V1::SessionsController < ApplicationController
  
  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      render json: {api_key: user.api_key}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
