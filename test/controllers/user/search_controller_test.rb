require 'test_helper'

class User::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get Search" do
    get user_search_Search_url
    assert_response :success
  end

end
