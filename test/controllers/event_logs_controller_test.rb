require 'test_helper'

class EventLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get event_logs_show_url
    assert_response :success
  end

end
