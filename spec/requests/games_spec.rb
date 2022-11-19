require 'rails_helper'

RSpec.describe "Games ", type: :request do
    
    it "returns all games" do
        get '/games'
        expect(response.status).to eq(200)
    end
    
end
