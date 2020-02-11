class RacesController < ApplicationController
  before_action :authenticate_user
  before_action :set_race, only: [:show, :update, :destroy]

  # GET /races
  def index
    @races = Race.order(:local).page params[:page]
    @total_race = Race.count

    races_locale = @races.map do |race|
                  {
                    id: race.id,
                    local: race.local,
                    description:  race.description,
                    status: race.status,
                    sponsor: !race.sponsor.nil? ? race.sponsor.name : '',
                    date_race: race.date_race.strftime('%Y-%m-%d')
                  }
                  end

    json = {races: races_locale, total: @total_race}
    render json: json
  end

  # GET /races/1
  def show
    json =
      {
          id: @race.id,
          local: @race.local,
          description: @race.description,
          status: @race.status,
          sponsor_id: @race.sponsor_id,
          date_race: @race.date_race.strftime('%Y-%m-%d')
      }.to_json
    render json: json
  end

  def new
    @sponsors = Sponsor.all
    @enums = Race.translated_statuses
    render json: {sponsors: @sponsors ,race_enums: @enums}
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
   if @race.destroy
    render json: {msg: "deletado"}
   else
    render json: @race.errors, status: :unprocessable_entity
   end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race
      @race = Race.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def race_params
      params.require(:race).permit(:id, :local, :description, :date_race, :status, :sponsor_id)
    end
end
