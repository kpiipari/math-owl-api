class Api::PlayerController < ApplicationController

    before_action :set_player, only: [:show, :update]

    def show 
        render json: @player
    end

    def create
        @player = Player.new(player_params)
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

    def player_params
        params.require(:player).permit(:name)
    end
end
