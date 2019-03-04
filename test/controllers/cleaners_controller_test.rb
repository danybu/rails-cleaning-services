require 'test_helper'

class CleanersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cleaners_index_url
    assert_response :success
  end

  test "should get show" do
    get cleaners_show_url
    assert_response :success
  end

end
