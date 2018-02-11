require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get post_home_url
    assert_response :success
  end

end
