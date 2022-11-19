require 'rails_helper'

RSpec.describe Team, type: :model do
  context 'validation test' do 
    
    it 'ensures name presence' do
      team = Team.new().save
      expect(team).to eq(false) 
    end
    
    it 'should save successfully' do
      team = Team.new(name: "Lolo").save
      expect(team).to eq(true) 
    end
  end
end