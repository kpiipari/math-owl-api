class Api::AdditionController < ApplicationController

    before_action :set_game, only: [:show, :edit]

    def index
        render json: Addition.all 
    end

    def create
        game = Addition.new
        game.round1 = game.create_round
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
        if @game.update(addition_params)
            render json: @game
        else
            render json: { message: @game.errors }, status: 400
        end
    end

    private

    def set_game
        @game = Addition.find_by(id: params[:id])
    end

    def addition_params
        params.require(:addition_game).permit(:rounds, :score, :time)
    end

    def create_rounds
        rounds = {}
        i = 0

        while i < 10
            key = "round" + i.to_s
            value = create_round
            rounds[:"#{key}"] = value
            i = i + 1
        end
        
        return rounds.to_json
    end

end

