require 'test_helper'

class DislikeTest < ActiveSupport::TestCase
	test "Testing the field id" do
		dislike = Dislike.new(id: "")
		assert_not dislike.save, "id cannot be null"
		dislike = Dislike.new(id: "123456")
		assert_not dislike.save, "id cannot be string"
	end

	test "Testing the field created_at" do
		dislike = Dislike.new(created_at: "")
		assert_not dislike.save, "created_at cannot be null"
		dislike = Dislike.new(created_at: "today")
		assert_not dislike.save, "created_at cannot be string"
	end

	test "Testing the field updated_at" do
		dislike = Dislike.new(updated_at: "")
		assert_not dislike.save, "updated_at cannot be null"
		dislike = Dislike.new(updated_at: "today")
		assert_not dislike.save, "updated_at cannot be string"
	end

	test "Testing the field user_id" do
		dislike = Dislike.new(user_id: "")
		assert_not dislike.save, "user_id cannot be null"
		dislike = Dislike.new(user_id: "mememememememe")
		assert_not dislike.save, "user_id cannot be string"
	end

	test "wrong type for post_id" do
		dislike = Dislike.new(post_id: "")
		assert_not dislike.save, "post_id cannot be null"
		dislike = Dislike.new(post_id: "mememememememe")
		assert_not dislike.save, "post_id cannot be a string"
	end

	test "should report error" do
		# some_undefined_variable is not defined elsewhere in the test case
		assert_raises(NameError) do
			some_undefined_variable
		end
	end
end
