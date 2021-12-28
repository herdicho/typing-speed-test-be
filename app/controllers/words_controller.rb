class WordsController < ApplicationController
    def index
        @word = Word.all 
        render json: @word

        # @word1 = Word.where(id: 17)
        # puts @word1[0].language_id.language
    end 

    def show
        @word = Word.find(params[:id])
        render json: @word
    end 

    def create
        puts params
        @word = Word.new(
            word: params[:word],
            language_id: params[:language_id]
        )

        if @word.save
            render json: {:status_code => "0000", :message => "success create new word", :payload => @word}, status: :ok
        else
            render json: {:status_code => "4200", :message => @word.errors}, status: :unprocessable_entity
        end 
    end 

    def update
        @word = Word.find(params[:id])
        @word.update(
            word: params[:word],
            language_id: params[:language_id]
        )
        render json: @word
    end 

    def destroy
        @words = Word.all 
        @word = Word.find(params[:id])
        @word.destroy
        render json: @words
    end 
end
