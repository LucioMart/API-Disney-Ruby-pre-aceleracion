class UsersController < ApplicationController

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.create(user_params)
        if user.valid?
           user = user
           token = JWT.encode({user_id: user.id}, secret, 'HS256')
           render json: {user: user, token: token}
        else
           render json: {errors: user.errors.full_messages}
        end
    end

end
