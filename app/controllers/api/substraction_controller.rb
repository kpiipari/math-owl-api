class Api::SubstractionController < ApplicationController
    before_action :set_game, only: [:show, :edit]

    def index
        render json: Substraction.all 
    end

    def new
        @game = Substraction.new
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
        game = Substraction.find(params[:id])
        if game.update(subtraction_params)
            game.save
            game.update_player_answer(game)
            render json: game
        else
            render json: { message: game.errors }, status: 400
        end
        
    end

    private

    def set_game
        @game = Substraction.find(params[:id])
    end

    def subtraction_params
        params.require(:substraction).permit(:user_answer, :player_id)
    end

end
