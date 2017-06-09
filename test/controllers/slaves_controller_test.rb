require 'test_helper'

class SlavesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get slaves_new_url
    assert_response :success
  end

end
