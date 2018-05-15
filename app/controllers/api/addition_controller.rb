class Api::AdditionController < ApplicationController

    before_action :set_game, only: [:show, :create]
    

    def index
        render json: Addition.all 
    end

    def new
        @game = Addition.new
        @game.rounds = @game.generate_rounds
        if @game.save
            render json: @game 
        else
            render json: {message: @game.errors }, status: 400
        end
    end

    def create
        if @game.save
            render json: @game 
        else
            render json: {message: @game.errors }, status: 400
        end
    end

    def show
        render json: @game
    end

    def update
        game = Addition.find(params[:id])
        if game.update(addition_params)
            game.save
            game.update_player_answer(game)
            render json: game
        else
            render json: { message: game.errors }, status: 400
        end
        
    end

    private

    def set_game
        @game = Addition.find(params[:id])
    end

    def addition_params
        params.require(:addition).permit(:user_answer, :player_id)
    end

    

end

