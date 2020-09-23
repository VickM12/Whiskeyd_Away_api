require 'test_helper'

class WhiskeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @whiskey = whiskeys(:one)
  end

  test "should get index" do
    get whiskeys_url, as: :json
    assert_response :success
  end

  test "should create whiskey" do
    assert_difference('Whiskey.count') do
      post whiskeys_url, params: { whiskey: { distiller: @whiskey.distiller, image: @whiskey.image, name: @whiskey.name, origin: @whiskey.origin } }, as: :json
    end

    assert_response 201
  end

  test "should show whiskey" do
    get whiskey_url(@whiskey), as: :json
    assert_response :success
  end

  test "should update whiskey" do
    patch whiskey_url(@whiskey), params: { whiskey: { distiller: @whiskey.distiller, image: @whiskey.image, name: @whiskey.name, origin: @whiskey.origin } }, as: :json
    assert_response 200
  end

  test "should destroy whiskey" do
    assert_difference('Whiskey.count', -1) do
      delete whiskey_url(@whiskey), as: :json
    end

    assert_response 204
  end
end
