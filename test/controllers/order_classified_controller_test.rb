require 'test_helper'

class OrderClassifiedControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_classified_create_url
    assert_response :success
  end

  test "should get update" do
    get order_classified_update_url
    assert_response :success
  end

  test "should get destroy" do
    get order_classified_destroy_url
    assert_response :success
  end

end
