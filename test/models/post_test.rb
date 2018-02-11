require './test/test_helper'

class PostTest < ActiveSupport::TestCase

	def test_should_not_save_post_without_poster
		post = Post.new
		assert !post.save
	end

	def test_should_not_save_post_without_description
		post = Post.new
		assert !post.save
	end

end
