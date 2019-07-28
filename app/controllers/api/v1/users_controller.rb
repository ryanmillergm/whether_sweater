class Api::V1::UsersController < ApplicationController
  def index
    # render json: UsersSerializer(User.new)
  end

  def create
    user = User.new(user_params)
    user.save
    if user.save
      user.api_key = SecureRandom.urlsafe_base64.to_s
      render json: {api_key: user.api_key}, status: :created
    elsif
      render nothing: true, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
