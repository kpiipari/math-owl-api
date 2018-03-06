class AdditionGame < ApplicationRecord

    def create_round
        num1 = rand(0...10)
        num2 = rand(0...10)
        answer = num1 + num2

        return {num1: num1, num2: num2, answer: answer}
    end

    def create_rounds
        rounds = {}
        i = 0

        while i >10

        end
        
        return rounds
    end

end
