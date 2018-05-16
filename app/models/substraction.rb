class Substraction < ApplicationRecord
    include GameExtension
    belongs_to :player, optional: true
    before_create :set_rounds 

    require 'json'

    def create_round
        num1 = rand(0...10)
        num2 = rand(0...10)
        correct_value = num1 - num2

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

end