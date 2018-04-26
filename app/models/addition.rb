class Addition < ApplicationRecord
    belongs_to :player

    require 'json'

    def create_round
        num1 = rand(0...10)
        num2 = rand(0...10)
        correct_value = num1 + num2

        round = {num1: num1, num2: num2, correct_value: correct_value}
        return round.to_json
    end
end
