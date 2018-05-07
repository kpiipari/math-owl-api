class Api::AdditionController < ApplicationController

    before_action :set_game, only: [:show, :edit]
    

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

    def test_create
        @game = Addition.find(params[:id])
      
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
        params.require(:addition).params.permit(rounds: [
            round1: [:player_answer],
            round2: [:player_answer],
            round3: [:player_answer],
            round4: [:player_answer],
            round5: [:player_answer],
            round6: [:player_answer],
            round7: [:player_answer],
            round8: [:player_answer],
            round9: [:player_answer],
            round10: [:player_answer]])
    end

end

