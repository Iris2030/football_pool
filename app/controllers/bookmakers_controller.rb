class BookmakersController < ApplicationController
  before_action :set_bookmaker, only: %i[ show edit update destroy ]

  # GET /bookmakers or /bookmakers.json
  def index
    @bookmakers = Bookmaker.all
  end

  # GET /bookmakers/1 or /bookmakers/1.json
  def show
  end

  # GET /bookmakers/new
  def new
    @bookmaker = Bookmaker.new
  end

  # GET /bookmakers/1/edit
  def edit
  end

  # POST /bookmakers or /bookmakers.json
  def create
    @bookmaker = Bookmaker.new(bookmaker_params)

    respond_to do |format|
      if @bookmaker.save
        format.html { redirect_to bookmaker_url(@bookmaker), notice: "Bookmaker was successfully created." }
        format.json { render :show, status: :created, location: @bookmaker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bookmaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmakers/1 or /bookmakers/1.json
  def update
    respond_to do |format|
      if @bookmaker.update(bookmaker_params)
        format.html { redirect_to bookmaker_url(@bookmaker), notice: "Bookmaker was successfully updated." }
        format.json { render :show, status: :ok, location: @bookmaker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bookmaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmakers/1 or /bookmakers/1.json
  def destroy
    @bookmaker.destroy

    respond_to do |format|
      format.html { redirect_to bookmakers_url, notice: "Bookmaker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmaker
      @bookmaker = Bookmaker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmaker_params
      params.fetch(:bookmaker, {})
    end
end
