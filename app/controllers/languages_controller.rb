class LanguagesController < ApplicationController
    def index
        @language = Language.all 
        render json: @language
    end 

    def show
        @language = Language.find(params[:id])
        render json: @language
    end 

    def create
        @language = Language.new(
            language: params[:language],
        )

        if @language.save
            render json: {:status_code => "0000", :message => "success create new language option", :payload => @language}, status: :ok
        else
            render json: {:status_code => "4200", :message => @language.errors}, status: :unprocessable_entity
        end 
    end 

    def update
        @language = Language.find(params[:id])
        @language.update(
            language: params[:language],
        )
        render json: @language
    end 

    def destroy
        @languages = Language.all 
        @language = Language.find(params[:id])
        @language.destroy
        render json: @languages
    end 
end
