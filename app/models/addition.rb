class Addition < ApplicationRecord
    belongs_to :player, optional: true
    before_create :set_rounds 

    require 'json'
    
    @@counter = 1
    @@score = 0
    
    def create_round
        num1 = rand(0...10)
        num2 = rand(0...10)
        correct_value = num1 + num2

        round = {num1: num1, num2: num2, correct_value: correct_value, player_answer: ""}
        return round
    end

    def generate_rounds
        rounds = {}
        i = 1
        while i < 11
            key = "round" + i.to_s
            value = create_round
            rounds[:"#{key}"] = value
            i = i + 1
        end
        return rounds
    end

    def update_player_answer(game)
        puts @@counter
        puts @@score
        key = "round" + @@counter.to_s
        value = game.user_answer
        game.rounds["#{key}"]["player_answer"] = value
        game.save
        check_answer(game)
        puts @@counter
        puts @@score
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

    #def get_total_score(game)
    #    if game.player_id != nil
    #        player = Player.find(game.player_id)
    #        player.total_score = total_score(player)
    #        player.save
    #    end
    #end

    private

    def total_score(player)
        puts total_score
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
        puts total_score
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

    def set_rounds
        self.rounds = generate_rounds
    end

end
