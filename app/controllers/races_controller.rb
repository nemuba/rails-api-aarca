class RacesController < ApplicationController
  before_action :set_race, only: [:show, :update, :destroy]

  # GET /races
  def index
    @races = Race.order(:local).page params[:page]
    @total_race = Race.count
    json = {races: @races, total: @total_race}
    render json: json
  end

  # GET /races/1
  def show
    render json: @race
  end

  # POST /races
  def create
    @race = Race.new(race_params)

    if @race.save
      render json: @race, status: :created, location: @race
    else
      render json: @race.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /races/1
  def update
    if @race.update(race_params)
      render json: @race
    else
      render json: @race.errors, status: :unprocessable_entity
    end
  end

  # DELETE /races/1
  def destroy
    @race.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race
      @race = Race.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def race_params
      params.require(:race).permit(:local, :description, :date_race)
    end
end
