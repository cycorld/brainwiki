require 'test_helper'

class NueronsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @nueron = nuerons(:one)
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nuerons)
  end

  test "should get new when login" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should redirect to sign_in when not login" do
    get :new
    assert_redirected_to new_user_session_path
  end

  test "should create nueron when login" do
    sign_in @user
    assert_difference('Nueron.count') do
      post :create, nueron: { note: @nueron.note, title: @nueron.title, user_id: @user.id, vid: @nueron.vid }
    end

    assert_redirected_to nueron_path(assigns(:nueron))
  end

  test "should show nueron" do
    get :show, id: @nueron
    assert_response :success
  end

  test "should get edit when login" do
    sign_in @user
    get :edit, id: @nueron
    assert_response :success
  end

  test "should update nueron" do
    sign_in @user
    patch :update, id: @nueron, nueron: { note: @nueron.note, title: @nueron.title, user_id: @nueron.user_id, vid: @nueron.vid }
    assert_redirected_to nueron_path(assigns(:nueron))
  end

  test "should destroy nueron when login" do
    sign_in @user
    assert_difference('Nueron.count', -1) do
      delete :destroy, id: @nueron
    end

    assert_redirected_to nuerons_path
  end
end
