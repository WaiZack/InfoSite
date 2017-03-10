require 'test_helper'

class MembershipRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get membership_requests_new_url
    assert_response :success
  end

end
