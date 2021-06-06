class AuthController < ApplicationController
  def login
    user = User.find_by(username: login_params[:username])
  end

  def persist
  end

  private
  def login_params
    params.permit(:username, :password)
end
