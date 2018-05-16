class Api::MultiplyController < ApplicationController
    before_action :set_game, only: [:show, :edit]

    def index
        render json: Multiply.all 
    end

    def new
        @game = Multiply.new
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
        game = Multiply.find(params[:id])
        if game.update(addition_params)
            game.save
            game.update_player_answer(game)
            game.get_total_score(game)
            render json: game
        else
            render json: { message: game.errors }, status: 400
        end
        
    end

    private

    def set_game
        @game = Multiply.find(params[:id])
    end

    def multiply_params
        params.require(:multiply).permit(:user_answer, :player_id)
    end

end
