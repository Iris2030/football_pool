require_relative "./application_api_controller"
class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
    # before_action :authorize_req
  
  
  def index
    @games = Game.all
    
    respond_to do |format|
      format.xml {render xml: @games}
      format.json {render json: @games, status: 200}
    end
  end
  
  
  def show
    @game = Game.find(params[:id])
    
    respond_to do |format|
      format.xml {render xml: @game}
      format.json {render json: @game, status: 200}
    end
  end
  
  
  # GET /games/new
  def new
    @game = Game.new
  end
  
  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end
  
  # POST /games or /games.json
  def create
    @game = Game.new(game_api_params)
    
    respond_to do |format|
      if @game.save
        format.json { render json: @game, status: :created, location: @game }
      else
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_api_params)
        format.json { render json: @game, status: :ok, location: @game }
      else
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
      # ScoringJob.perform_later()
    end
  end
  
  def add_score
    @game = Game.find(params[:id])
    # ScoringJob.perform_later()
    
  end
  
  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy
    
    respond_to do |format|
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end
  
  
  
  # Only allow a list of trusted parameters through.
  def game_api_params
    params.fetch(:game, {}).permit(:id, :date, :first_team_id, :second_team_id, :first_team_score, :second_team_score, :status)
  end
end



