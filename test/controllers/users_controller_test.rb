require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get signup page before siginin" do
    get :new
    assert_response :success
  end
end
