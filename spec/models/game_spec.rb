require 'rails_helper'

RSpec.describe Game, type: :model do
  context "validation tests" do 
    user = User.first
    it 'creates a new game without game name' do
      expect{ Game.create!(user_id: user.id, price: 999, year_purchased: 1999) }.to raise_error('Validation failed: Game name can\'t be blank')
    end

    it 'creates a new game without price' do
      expect{ Game.create!(user_id: user.id, game_name:'stress', year_purchased: 1999) }.to raise_error('Validation failed: Price can\'t be blank')
    end

    it 'should have 4 numerical for year purchased' do
      expect{ Game.create!(user_id: user.id, game_name:'stress', price: 200, year_purchased: 199) }.to raise_error('Validation failed: Year purchased is the wrong length (should be 4 characters)')
    end

    it 'should belong to user' do
      expect(Game.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

  end
end
