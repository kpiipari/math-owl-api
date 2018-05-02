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
        game = Substraction.new
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
        if @game.update(substraction_params)
            render json: @game
        else
            render json: { message: @game.errors }, status: 400
        end
    end

    private

    def set_game
        @game = Substraction.find_by(id: params[:id])
    end

    def substraction_params
        params.require(:substraction_game).permit(:rounds, :score, :time)
    end

end
