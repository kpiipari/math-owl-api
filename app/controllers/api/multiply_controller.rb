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
        game = Multiply.new
        game.score = 0
        game.time = Time.now
        game.rounds = game.generate_rounds
      
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
        if @game.update(multiply_params)
            render json: @game
        else
            render json: { message: @game.errors }, status: 400
        end
    end

    private

    def set_game
        @game = Multiply.find_by(id: params[:id])
    end

    def multiply_params
        params.require(:multiply_game).permit(:rounds, :score, :time)
    end

end
