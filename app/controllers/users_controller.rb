class UsersController < ApplicationController
    before_action :authorized, except: [:create, :login]

    def index
        val = JWT.decode(request.headers['Authorization'].split(' ').last, 's3cr3t', true, algorithm: 'HS256').first
        puts val['user_id']
        
        @user = User.all 
        render json: @user
    end 

    def show
        @user = User.find(params[:id])
        render json: @user
    end 

    def login 
        @user = User.find_by(username: params[:username])

        if @user 
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else
            render json: {error: "Invalid username or password"}
        end
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
