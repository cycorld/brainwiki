require 'test_helper'

class StartingsControllerTest < ActionController::TestCase
  setup do
    @starting = startings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:startings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create starting" do
    assert_difference('Starting.count') do
      post :create, starting: { description: @starting.description, nueron_id: @starting.nueron_id, subtitle: @starting.subtitle, title: @starting.title, user_id: @starting.user_id }
    end

    assert_redirected_to starting_path(assigns(:starting))
  end

  test "should show starting" do
    get :show, id: @starting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @starting
    assert_response :success
  end

  test "should update starting" do
    patch :update, id: @starting, starting: { description: @starting.description, nueron_id: @starting.nueron_id, subtitle: @starting.subtitle, title: @starting.title, user_id: @starting.user_id }
    assert_redirected_to starting_path(assigns(:starting))
  end

  test "should destroy starting" do
    assert_difference('Starting.count', -1) do
      delete :destroy, id: @starting
    end

    assert_redirected_to startings_path
  end
end
