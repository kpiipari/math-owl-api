class Player < ApplicationRecord
    has_many :additions
    has_many :substractions
    has_many :multiplies

    def addition_game_scores(player)
        games = player.additions
        return games.reduce(0) { |sum, game| sum + game.score}
    end

    def subtract_game_scores(player)
        games = player.substractions
        return games.reduce(0) { |sum, game| sum + game.score}
    end

    def multiply_game_scores(player)
        games = player.multiply
        return games.reduce(0) { |sum, game| sum + game.score}
    end

    def total_score(player)
        return addition_game_scores(player) + subtract_game_scores(player) + multiply_game_scores(player)
    end

end
