require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'validation test' do 
    
    it 'ensures second team id presence' do
      game = Game.new(first_team_id: 2).save
      expect(game).to eq(false) 
    end
    
    it 'ensures first team id presence' do
      game = Game.new(second_team_id: 2).save
      expect(game).to eq(false) 
    end
    
    it 'should save successfully' do
      game = Game.new(first_team_id: 2, second_team_id: 2).save
      expect(game).to eq(true) 
    end
    
  end
  
  # SCOPE TESTING -----------------------------------
  
  context 'scope test' do 
    let (:params) {{first_team_id: 2, second_team_id: 4}}
    before(:each) do
      Game.new(params.merge(status: 'ended')).save
      Game.new(params.merge(status: 'ended')).save
      Game.new(params.merge(status: 'ended')).save
      Game.new(params.merge(status: 'expected')).save
      Game.new(params.merge(status: 'expected')).save
      Game.new(params.merge(status: 'ended')).save
      
    end
    
    it 'should return ended games' do
      expect(Game.ended_games.size).to eq(8)
    end
    
    it 'should return expected games' do
      expect(Game.expected_games.size).to eq(4)
    end
    
  end
end
