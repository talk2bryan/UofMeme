require './test/test_helper'

class PostTest < ActiveSupport::TestCase
  test "post creation" do
    @post_1_poster = posts(:post_1).poster
    @post_2_desc = posts(:post_2).description
    assert_equal("Riley", @post_1_poster)
    assert_equal("memes4dayz", @post_2_desc)
  end

	def test_should_not_save_post_without_poster
		post = Post.new
		assert !post.save
	end

	def test_should_not_save_post_without_description
		post = Post.new
		assert !post.save
	end
end
