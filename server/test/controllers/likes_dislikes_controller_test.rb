  require './test/test_helper'

  class PostsControllerTest < ActionDispatch::IntegrationTest
  include FactoryBot::Syntax::Methods
  include SignInHelper

  test "user can post score" do
  @user = build :user
  sign_in_as @user

  @post = build :post
  assert "strong#likes", { :count => 1, :text => "0" }
  assert "strong#dislikes", { :count => 1, :text => "0" }
  end
  end
