require 'rails_helper'

RSpec.describe Pool, type: :model do
  context 'validation test' do 
    
    it 'ensures pred first team score  presence' do
      pool = Pool.new(pred_second_team_score: 22).save
      expect(pool).to eq(false) 
    end
    
    it 'ensures  pred second team score presence' do
      pool = Pool.new(pred_first_team_score: 12).save
      expect(pool).to eq(false) 
    end
    
    it 'should save successfully' do
      pool = Pool.new(game_id: 8,user_id: 4, pred_second_team_score: 2, pred_first_team_score: 2).save
      expect(pool).to eq(true) 
    end
    
  end
end
