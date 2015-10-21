require 'test_helper'

class NueronsControllerTest < ActionController::TestCase
  setup do
    @nueron = nuerons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nuerons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nueron" do
    assert_difference('Nueron.count') do
      post :create, nueron: { note: @nueron.note, title: @nueron.title, user_id: @nueron.user_id, vid: @nueron.vid }
    end

    assert_redirected_to nueron_path(assigns(:nueron))
  end

  test "should show nueron" do
    get :show, id: @nueron
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nueron
    assert_response :success
  end

  test "should update nueron" do
    patch :update, id: @nueron, nueron: { note: @nueron.note, title: @nueron.title, user_id: @nueron.user_id, vid: @nueron.vid }
    assert_redirected_to nueron_path(assigns(:nueron))
  end

  test "should destroy nueron" do
    assert_difference('Nueron.count', -1) do
      delete :destroy, id: @nueron
    end

    assert_redirected_to nuerons_path
  end
end
