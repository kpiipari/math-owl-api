require 'rails_helper'

RSpec.describe  AdditionGame, type: :model do
    before(:each) do
        @game = AdditionGame.create
    end

    describe '#create_round' do
        it 'returns a hash' do
            round = @game.create_round
            expect(round).to be_a(Hash)
        end
    end
end

