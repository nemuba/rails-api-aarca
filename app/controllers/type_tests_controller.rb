class TypeTestsController < ApplicationController
  before_action :set_type_test, only: [:show, :update, :destroy]

  # GET /type_tests
  def index
    @type_tests = TypeTest.order(:genre).page params[:page]
    @total_type = TypeTest.count

    json = {type_tests: @type_tests, total: @total_type}

    render json: json
  end

  # GET /type_tests/1
  def show
    render json: @type_test
  end

  # POST /type_tests
  def create
    @type_test = TypeTest.new(type_test_params)

    if @type_test.save
      render json: @type_test, status: :created, location: @type_test
    else
      render json: @type_test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /type_tests/1
  def update
    if @type_test.update(type_test_params)
      render json: @type_test
    else
      render json: @type_test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /type_tests/1
  def destroy
    @type_test.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_test
      @type_test = TypeTest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def type_test_params
      params.require(:type_test).permit(:genre, :oar)
    end
end
