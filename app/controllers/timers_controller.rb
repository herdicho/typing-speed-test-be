class TimersController < ApplicationController
    def index
        @timer = Timer.all 
        render json: @timer
    end 

    def show
        @timer = Timer.find(params[:id])
        render json: @timer
    end 

    def create
        @timer = Timer.new(
            timer: params[:timer],
        )

        if @timer.save
            render json: {:status_code => "0000", :message => "success create new timer option", :payload => @timer}, status: :ok
        else
            render json: {:status_code => "4200", :message => @timer.errors}, status: :unprocessable_entity
        end 
    end 

    def update
        @timer = Timer.find(params[:id])
        @timer.update(
            timer: params[:timer],
        )
        render json: @timer
    end 

    def destroy
        @timers = Timer.all 
        @timer = Timer.find(params[:id])
        @timer.destroy
        render json: @timers
    end 
end
