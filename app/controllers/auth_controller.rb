class AuthController < ApplicationController
  def login
    user = User.find_by(username: login_params[:username])
    if user && user.authenticate(login_params[:password])
      token = JWT.encode({user_id: user_id}, secret, 'HS256')
      render json: {user: user, token: token}
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def persist
  end

  private
  def login_params
    params.permit(:username, :password)
end
