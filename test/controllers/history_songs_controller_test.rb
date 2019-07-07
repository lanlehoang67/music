require 'test_helper'

class HistorySongsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get history_songs_index_url
    assert_response :success
  end

end
