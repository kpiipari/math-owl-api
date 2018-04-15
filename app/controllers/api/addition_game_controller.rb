class Api::AdditionGameController < ApplicationController

    before_action :set_game, only: [:show, :edit]

    def index
        render json: AdditionGame.all 
    end

    def create
        game = AdditionGame.new
        game.rounds = game.create_round
        game.score = 0
        game.time = Time.now
        if game.save
            render json: game 
        else
            render json: {message: game.errors }, status: 400
        end  
    end

    def show
        render json: @game
    end

    def update
        if @game.update(addition_game_params)
            render json: @game
        else
            render json: { message: @game.errors }, status: 400
        end
    end

    private

    def set_game
        @game = AdditionGame.find_by(id: params[:id])
    end

    def addition_game_params
        params.require(:addition_game).permit(:rounds, :score, :time)
    end

end
