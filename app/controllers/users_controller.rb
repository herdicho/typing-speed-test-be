class UsersController < ApplicationController
    def index
        @user = User.all 
        render json: @user
    end 

    def show
        @user = User.find(params[:id])
        render json: @user
    end 

    def create
        @user = User.new(
            username: params[:username],
            email: params[:email],
            full_name: params[:full_name]
        )

        if @user.save
            render json: {:status_code => "0000", :message => "success create new user", :payload => @user}, status: :ok
        else
            render json: {:status_code => "4200", :message => @user.errors}, status: :unprocessable_entity
        end 
    end 

    def update
        @user = User.find(params[:id])
        @user.update(
            full_name: params[:full_name],
            username: params[:username],
            email: params[:email]
        )
        render json: @user
    end 

    def destroy
        @users = User.all 
        @user = User.find(params[:id])
        @user.destroy
        render json: @users
    end 
end
