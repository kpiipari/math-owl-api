module GameExtension
    extend ActiveSupport::Concern

    @@counter = 1
    @@score = 0

    def update_player_answer(game)
        key = "round" + @@counter.to_s
        value = game.user_answer
        game.rounds["#{key}"]["player_answer"] = value
        game.save
        check_answer(game)
    end

    def check_answer(game)
        key = "round" + @@counter.to_s
        correct_value = game.rounds["#{key}"]["correct_value"]
        player_answer = game.rounds["#{key}"]["player_answer"]
        if correct_value === player_answer
            game.score = @@score + 1
            game.save
            @@score = @@score + 1
        end
        @@counter = @@counter + 1
        reset_score()
        reset_counter()
    end

    def get_total_score(game)
        if game.player_id != nil
            player = Player.find(game.player_id)
            player.total_score = total_score(player)
            player.save
        end
    end

    private

    def total_score(player)
        addition_games = 0
        subtraction_games = 0
        multiply_games = 0 
        if player.additions
            addition_games = player.additions.reduce(0) { |sum, game| sum + game.score}
        end
        if player.substractions
            subtraction_games = player.substractions.reduce(0) { |sum, game| sum + game.score}
        end
        if player.multiplies
            multiply_games = player.multiplies.reduce(0) { |sum, game| sum + game.score}
        end 
        total_score = addition_games + subtraction_games + multiply_games
        return total_score
    end
    
    def reset_score
        if @@score === 10 
            @@score = 0
        elsif @@counter === 11
            @@score = 0
        end
    end

    def reset_counter
        if @@counter === 11
            @@counter = 1
        end
    end


end