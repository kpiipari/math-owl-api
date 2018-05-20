class Api::PlayerController < ApplicationController

    def index
        players = Player.rank
        render json: players
    end

    def show 
        player = Player.find(params[:id])
        player.total_score = player.get_score(player)
        player.save
        puts player.total_score
        render json: player
    end

    def create
        @player = Player.new(player_params)
        if @player.save
            render json: @player 
        else
            render json: {message: @player.errors }, status: 400
        end
    end

    def update
        player = Player.find(params[:id])
        if player.update(player_params)
            player.save
            player.hello(player.name)
            render json: player
        else
            render json: { message: player.errors }, status: 400
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
