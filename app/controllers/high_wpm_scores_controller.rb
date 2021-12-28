class HighWpmScoresController < ApplicationController
    def index
        @highWPMScore = HighWpmScore.all 
        render json: @highWPMScore
    end 

    def show
        @highWPMScore = HighWpmScore.find(params[:id])
        render json: @highWPMScore
    end 

    def create
        @highWPMScore = HighWpmScore.new(
            user_id: params[:user_id],
            timer_id: params[:timer_id],
            language_id: params[:language_id],
            wpm_score: params[:wpm_score]
        )

        if @highWPMScore.save
            render json: {:status_code => "0000", :message => "success create new WPM score", :payload => @highWPMScore}, status: :ok
        else
            render json: {:status_code => "4200", :message => @highWPMScore.errors}, status: :unprocessable_entity
        end
    end 

    def search
    render json: {:message => "ceki uwaw"}
    end
end
