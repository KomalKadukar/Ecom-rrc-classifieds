require 'test_helper'

class ClassifiedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get classified_index_url
    assert_response :success
  end

  test "should get show" do
    get classified_show_url
    assert_response :success
  end

end
