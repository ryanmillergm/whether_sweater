class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      user.api_key = SecureRandom.urlsafe_base64.to_s
      render json: {api_key: user.api_key}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
