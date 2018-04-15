class Api::AdditionGameController < ApplicationController

    def index
        render json: AdditionGame.all 
    end

end
