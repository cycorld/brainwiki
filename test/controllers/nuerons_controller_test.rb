require 'test_helper'

class NueronsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @nueron = nuerons(:one)
    @user = users(:one)
    @user2 = users(:two)
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

  test "should get edit when login" do
    sign_in @user
    get :edit, id: @nueron
    assert_response :success
  end

  test "should update nueron" do
    sign_in @user
    patch :update, id: @nueron, nueron: { note: @nueron.note + "update", title: @nueron.title, user_id: @nueron.user_id, vid: @nueron.vid }
    assert_redirected_to nueron_path(assigns(:nueron))
  end

end
