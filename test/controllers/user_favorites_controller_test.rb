require 'test_helper'

class UserFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_favorites_new_url
    assert_response :success
  end

end
