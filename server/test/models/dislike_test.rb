require 'test_helper'

class DislikeTest < ActiveSupport::TestCase
	setup do
    @user = users(:user1)
    @post = Post.new
    @post.poster =  'mmmmmmmm'
    file_path = Rails.root.join('test', 'fixtures', 'files', 'test.png')
    @post.image = fixture_file_upload(file_path, 'image/png')
    @post.description = "my mememe"
    @post.user_id = @user.id
    assert @post.save!
  end

	test "should save dislike with valid input" do
		dislike = Dislike.new(user_id: @user.id, post_id: @post.id)
		assert dislike.save!
	end

	test "should not save dislike with invalid user_id input" do
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

	test "should not save dislike with invalid post_id input" do
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

	test "should not save dislike with null input" do
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
