class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  before_action :before_show, only: %i[ show ]

  after_action :after_index, only: %i[ index ]
  
  # GET /games or /games.json
  def index
    @games = Game.all
    
    respond_to do |format|
      format.html
      format.xml {render xml: @games}
      format.json {render json: @games, status: 404}
    end
    
  end
  
  # GET /games/1 or /games/1.json
  def show
    @game = Game.find(params[:id])
         end
  
  def show_scoreboard
    @games = Game.all
    
    respond_to do |format|
      format.html
      format.xml {render xml: @games}
      format.json {render json: @games, status: 404}
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
    @game = Game.new(game_params)
    
    puts (params[:first_team_id])
    
    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def add_score
    @game = Game.find(params[:id])
    ScoringJob.perform_later()
    
  end
  
  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy
    
    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end
  
  def after_index
    puts "It's an index method"
    
  end

  def before_show
    puts "It's a show method"
    
  end
  
  # Only allow a list of trusted parameters through.
  def game_params
    params.fetch(:game, {}).permit(:id, :date, :first_team_id, :second_team_id, :first_team_score, :second_team_score, :status)
  end
end
