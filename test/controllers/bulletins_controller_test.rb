require 'test_helper'

class BulletinsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
