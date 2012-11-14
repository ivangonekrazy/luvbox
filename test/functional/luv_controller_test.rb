require 'test_helper'

class LuvControllerTest < ActionController::TestCase
  test "should get show_luv" do
    get :show_luv
    assert_response :success
  end

  test "should get send_luv" do
    get :send_luv
    assert_response :success
  end

end
