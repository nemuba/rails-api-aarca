require 'test_helper'

class TypeTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_test = type_tests(:one)
  end

  test "should get index" do
    get type_tests_url, as: :json
    assert_response :success
  end

  test "should create type_test" do
    assert_difference('TypeTest.count') do
      post type_tests_url, params: { type_test: { genre: @type_test.genre, oar: @type_test.oar } }, as: :json
    end

    assert_response 201
  end

  test "should show type_test" do
    get type_test_url(@type_test), as: :json
    assert_response :success
  end

  test "should update type_test" do
    patch type_test_url(@type_test), params: { type_test: { genre: @type_test.genre, oar: @type_test.oar } }, as: :json
    assert_response 200
  end

  test "should destroy type_test" do
    assert_difference('TypeTest.count', -1) do
      delete type_test_url(@type_test), as: :json
    end

    assert_response 204
  end
end
