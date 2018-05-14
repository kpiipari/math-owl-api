class Api::PlayerController < ApplicationController

    before_action :set_player, only: [:show, :update]

    def create
        @player = Player.new(:name)
           
            if @player.save
                render json: @player 
            else
                render json: {message: @player.errors }, status: 400
            end
    end

    private

    def set_player
        @player = Player.find(params[:id])
    end

    def addition_params
        params.require(:addition).permit(:user_answer)
    end
end
