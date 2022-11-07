class Api::V1::PoolsController < ApplicationController
  before_action :set_pool, only: %i[ show edit update destroy ]

  # GET /pools or /pools.json
  def index
    @pools = Pool.all

    respond_to do |format|
        format.xml {render xml: @pools}
        format.json {render json: @pools, status: 404}
            end
  end

  # GET /pools/1 or /pools/1.json
  def show
    @pool = Pool.find(params[:id])

    respond_to do |format|
     format.xml {render xml: @pool}
     format.json {render json: @pool, status: 404}
         end
  end

  # GET /pools/new
  def new
    @pool = Pool.new
  end

  # GET /pools/1/edit
  def edit
  end

  def edit_bet
    @pool = Pool.find(params[:id])
  end

  # POST /pools or /pools.json
  def create
    @pool = Pool.new(pool_params)

    respond_to do |format|
      if @pool.save
        format.json { render json: @pool, status: :created, location: @pool }
      else
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /pools/1 or /pools/1.json
  def update
     respond_to do |format|
                  if @pool.update(pool_params)
                    format.json { render json: @pool, status: :ok, location: @pool }
                  else
                    format.json { render json: @pool.errors, status: :unprocessable_entity }
                  end
                end
  end

  # DELETE /pools/1 or /pools/1.json
  def destroy
    @pool.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pool_params
      params.fetch(:pool, {}).permit(:id,:user_id, :game_id, :pred_first_team_score, :pred_second_team_score, :points)
    end
end
