class Player < ApplicationRecord
    has_many :additions
    has_many :subtractions
    has_many :multiplies

   
    def get_score(player)
        player = player
        puts player.additions
        puts player.subtractions
        puts player.multiplies
        addition_games = 0
        subtraction_games = 0
        multiply_games = 0 
        if player.additions.length > 0
            addition_games = player.additions.reduce(0) { |sum, game| sum + game.score}
        end
        if player.subtractions.length > 0
            subtraction_games = player.subtractions.reduce(0) { |sum, game| sum + game.score}
        end
        if player.multiplies.length > 0
            multiply_games = player.multiplies.reduce(0) { |sum, game| sum + game.score}
        end 
        total_score = addition_games + subtraction_games + multiply_games
        return total_score
    end

end
