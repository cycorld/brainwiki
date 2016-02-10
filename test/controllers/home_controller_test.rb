require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @nueron = nuerons(:one)
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show nueron" do
    sign_in @user
    get :show, token: @nueron.token
    assert_response :success
  end

end
