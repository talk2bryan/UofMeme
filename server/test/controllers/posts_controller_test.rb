require './test/test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "can create a post" do
    get "/posts/new"
    assert_response :success

    post "/posts", params: { post: { poster: "new poster", description: "a new test post" } }
    assert_response :success
  end
end
