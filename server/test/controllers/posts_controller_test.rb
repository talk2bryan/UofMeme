require './test/test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
	include FactoryBot::Syntax::Methods
	include SignInHelper

  	test "user can create a post" do
  		@user = build :user	
  		sign_in_as @user

  		@post = build :post, poster: @user.username, description: "this is a test post"
  		assert 'p#p_desc_h', :text => "this is a test post"
  	end

  	test "user can see other posts" do
  		@user = build :user
  		sign_in_as @user

  		@posts = Array.new(3)
  		(0..2).each do |i|
  			@posts[i] = build :post
  		end

  		assert 'p#p_desc_h', @posts[0].description
  		assert 'p#p_desc_h', @posts[1].description
  		assert 'p#p_desc_h', @posts[2].description
  	end

    test "posts have like and dislike buttons" do
      @user = build :user 
      sign_in_as @user

      @post = build :post
      assert 'a.glyphicon glyphicon-thumbs-up glyphicon-align-center'  #thumbs up icon
      assert 'a.glyphicon glyphicon-thumbs-down glyphicon-align-center'  #thumbs up icon
    end
end
