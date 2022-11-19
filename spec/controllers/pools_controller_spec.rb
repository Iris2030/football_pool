require 'rails_helper'

RSpec.describe PoolsController, type: :controller do
  context "GET /index" do
    it "returns a successfull response" do
      get :index
      expect(response.status).to eq(200)
    end
  end
  
  context "GET /show" do
    it "returns a successfull response" do
      pool = Pool.create!(game_id: 8,user_id: 4, pred_second_team_score: 2, pred_first_team_score: 2)
      get :show,  params: {id: pool.to_param}
      expect(response).to have_http_status(:ok)
    end
  end
end