require 'test_helper'

class TeamsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teams_controller_new_url
    assert_response :success
  end

  test "should get show" do
    get teams_controller_show_url
    assert_response :success
  end

  test "should get edit" do
    get teams_controller_edit_url
    assert_response :success
  end

  test "should get index" do
    get teams_controller_index_url
    assert_response :success
  end

end
