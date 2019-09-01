require 'test_helper'

class SensorsControllerTest < ActionDispatch::IntegrationTest
  test "should get temp" do
    get sensors_temp_url
    assert_response :success
  end

end
