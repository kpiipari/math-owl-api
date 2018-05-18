class Api::SubtractionController < ApplicationController
    before_action :set_game, only: [:show, :edit]

    def index
        render json: Subtraction.all 
    end

    def new
        @game = Subtraction.new
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
        game = Subtraction.find(params[:id])
        if game.update(subtraction_params)
            game.save
            if subtraction_params.has_key?(:user_answer)
                game.update_player_answer(game)
            end
            render json: game
        else
            render json: { message: game.errors }, status: 400
        end
    end

    private

    def set_game
        @game = Subtraction.find(params[:id])
    end

    def subtraction_params
        params.require(:subtraction).permit(:user_answer, :player_id)
    end

end
