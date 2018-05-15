class Multiply < ApplicationRecord
    belongs_to :player, optional: true
    before_create :set_rounds 

    require 'json'

    @@counter = 1
    @@score = 0

    def create_round
        num1 = rand(0...10)
        num2 = rand(0...10)
        correct_value = num1 * num2

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
        key = "round" + @@counter.to_s
        value = game.user_answer
        game.rounds["#{key}"]["player_answer"] = value
        game.save
        check_answer(game)
        @@counter = @@counter + 1
        if @@counter === 11
            @@counter = 1
        end
    end

    def check_answer(game)
        key = "round" + @@counter.to_s
        correct_value = game.rounds["#{key}"]["correct_value"]
        player_answer = game.rounds["#{key}"]["player_answer"]
        if correct_value === player_answer
            game.score = @@score + 1
            @@score = @@score + 1
            game.save
        end
    end

    private
    
    def set_rounds
        self.rounds = generate_rounds
    end

end
