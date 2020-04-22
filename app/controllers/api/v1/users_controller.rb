class Api::V1::UsersController < ApplicationController

    def index
        user = User.all
        render json: users, status: 200
    end

    def show
        user = User.find(params[:id])
        render json: users, status: 200
    end

    def create
        user = User.create(user_params)
        render json: users, status: 200
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: users, status: 200
    end

    def destroy
        user = User.find(params[:id])
        user.delete

        render json: {userId: user.id}
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end