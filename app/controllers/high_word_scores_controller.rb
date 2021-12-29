class HighWordScoresController < ApplicationController
    before_action :authorized

    def index
        @highWordScore = HighWordScore.all 
        render json: @highWordScore
    end 

    def show
        @highWordScore = HighWordScore.find(params[:id])
        render json: @highWordScore
    end 

    def create
        @user = logged_in_user()

        @highWordScore = HighWordScore.new(
            user_id: @user.id,
            timer_id: params[:timer_id],
            language_id: params[:language_id],
            word_score: params[:word_score]
        )

        if @highWordScore.save
            render json: {:status_code => "0000", :message => "success create new Word score", :payload => @highWordScore}, status: :ok
        else
            render json: {:status_code => "4200", :message => @highWordScore.errors}, status: :unprocessable_entity
        end
    end 
end
