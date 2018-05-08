class Api::AdditionController < ApplicationController

    before_action :set_game, only: [:show, :create, :update]
    
    CURRENT_ROUND = 1;

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
        if @game.update(addition_params)
            update_player_answer(@game)
            @game.save
            render json: @game
        else
            render json: { message: @game.errors }, status: 400
        end
    end

    private

    def set_game
        @game = Addition.find(params[:id])
    end

    def addition_params
        params.require(:addition).permit(:answer)
    end

    def update_player_answer(game)
        round_key = "round#{CURRENT_ROUND}"
        game.rounds[round_key]["player_answer"] = game.player_answer
        game.player_answer = ""
        CURRENT_ROUND + 1
    end

end

