require 'rails_helper'

RSpec.describe GamesController, type: :controller do
    describe "GET /index" do


    it "returns a successfull response" do
      get :index
      expect(response).to render_template("index")
    end

    it "has a 200 status code" do
        get :index
        expect(response.status).to eq(200)
      end

    end


    context "GET /show" do
        it "returns a successfull response" do
            game = Game.create!(first_team_id: 2, second_team_id: 2)
          get :show, params: {id: game.to_param}
          expect(response).to have_http_status(:ok)
        end

        it "returns a successfull response" do
            game = Game.create!(first_team_id: 2, second_team_id: 2)
          get :show, params: {id: game.to_param}
          expect(response.content_type).to eq "text/html; charset=utf-8"
        end
        end

  end