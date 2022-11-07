class Api::V1::TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all


    respond_to do |format|
      format.xml {render xml: @teams}
      format.json {render json: @teams, status: 404}
          end
  end

  # GET /teams/1 or /teams/1.json
  def show
    @pool = Team.find(params[:id])

    respond_to do |format|
     format.xml {render xml: @team}
     format.json {render json: @team, status: 404}
         end
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.json { render json: @team, status: :created, location: @team }
      else
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.json { render json: @team, status: :ok, location: @team }
      else
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.fetch(:team, {}).permit(:id, :name, :logo, :team_photo)
    end
end
