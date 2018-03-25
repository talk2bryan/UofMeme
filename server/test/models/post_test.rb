require './test/test_helper'

class PostTest < ActiveSupport::TestCase
	# test 'all fixture posts are saved in db' do
		#   @valid = Post.find_by_poster 'meme man'
		#   @no_poster = Post.find_by_description 'I have no name'
		#   @no_desc = Post.find_by_poster 'mute man'

		#   assert @valid, 'did not find post: valid_post'
		#   assert @no_poster, 'did not find post: no_poster'
		#   assert @no_desc, 'did not find post: no_description'
	# end

	test 'valid post' do
		@user = users(:user1)
		
		@post = Post.new
		@post.poster = 'mememe'
		@post.image = File.new("test/fixtures/files/test.png")
		@post.description = 'I love meme'
		@post.user_id = @user.id
		assert @post.save
	end

	test 'do not save blank post' do
		@blank_post = Post.new
		assert_not @blank_post.save,'should not be allowed to save blank post'
	end
end
