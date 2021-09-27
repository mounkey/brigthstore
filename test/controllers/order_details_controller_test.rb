require 'test_helper'

class OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get order_details_new_url
    assert_response :success
  end

  test "should get create" do
    get order_details_create_url
    assert_response :success
  end

  test "should get update" do
    get order_details_update_url
    assert_response :success
  end

  test "should get destroy" do
    get order_details_destroy_url
    assert_response :success
  end

end
