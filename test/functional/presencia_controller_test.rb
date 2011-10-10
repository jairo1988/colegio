require 'test_helper'

class PresenciaControllerTest < ActionController::TestCase
  setup do
    @presencium = presencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presencium" do
    assert_difference('Presencium.count') do
      post :create, presencium: @presencium.attributes
    end

    assert_redirected_to presencium_path(assigns(:presencium))
  end

  test "should show presencium" do
    get :show, id: @presencium.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presencium.to_param
    assert_response :success
  end

  test "should update presencium" do
    put :update, id: @presencium.to_param, presencium: @presencium.attributes
    assert_redirected_to presencium_path(assigns(:presencium))
  end

  test "should destroy presencium" do
    assert_difference('Presencium.count', -1) do
      delete :destroy, id: @presencium.to_param
    end

    assert_redirected_to presencia_path
  end
end
