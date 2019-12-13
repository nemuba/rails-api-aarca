class TestsController < ApplicationController
  before_action :authenticate_user
  before_action :set_test, only: [:show, :update, :destroy]

  # GET /tests
  def index
    @tests = Test.includes(:race, :type_test).page params[:page]
    @total_test = Test.count

    json  = @tests.map do |test|
            {
              id: test.id,
              race: test.race.local,
              type_test: "#{test.type_test.genre} - #{test.type_test.oar} remo(s)"
            }
          end
    json = {tests: json, total: @total_test}
    render json: json
  end

  def new
    @races = Race.order(:description)
    @type_tests = TypeTest.order(:genre)

    json = {races: @races, type_tests: @type_tests}

    render json: json
  end

  # GET /tests/1
  def show
    render json: @test
  end

  # POST /tests
  def create
    @test = Test.new(test_params)

    if @test.save
      render json: @test, status: :created, location: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tests/1
  def update
    if @test.update(test_params)
      render json: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tests/1
  def destroy
    if @test.destroy!
      render json: {msg: 'deletado !'}
    else
      render json: @test.errors
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_params
      params.require(:test).permit(:race_id, :type_test_id)
    end
end
