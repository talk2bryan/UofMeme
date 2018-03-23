require 'test_helper'

class DislikeTest < ActiveSupport::TestCase
	def setup
		@user = users(:user1)
		@post = posts(:valid_post)
	end

	test "Testing valid dislike input" do
		# since there are existing user in user_id and post in post_id
		# so this test should pass
		dislike = Dislike.new(user_id: @user.id, post_id: @post.id)
		assert dislike.save
	end

	test "Testing invalid user_id input" do
		# missing out user_id input
		dislike = Dislike.new(post_id: @post.id)
		assert_not dislike.save
		# using user_id that does not exist
		dislike = Dislike.new(user_id: 123456, post_id: @post.id)
		assert_not dislike.save
		# putting empty string for user_id
		dislike = Dislike.new(user_id: "", post_id: @post.id)
		assert_not dislike.save
	end

	test "Testing invalid post_id input" do
		# missing out post_id input
		dislike = Dislike.new(user_id: @user.id)
		assert_not dislike.save
		# using post_id that does not exist
		dislike = Dislike.new(user_id: @user.id, post_id: 123456)
		assert_not dislike.save
		# putting empty string for post_id
		dislike = Dislike.new(user_id: @user.id, post_id: "")
		assert_not dislike.save
	end

	test "Testing null input" do
		dislike = Dislike.new
		assert_not dislike.save
	end

	test "should report error" do
		# some_undefined_variable is not defined elsewhere in the test case
		assert_raises(NameError) do
			some_undefined_variable
		end
	end
end
