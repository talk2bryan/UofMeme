require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post creation" do
    @post_1_poster = posts(:post_1).poster
    @post_2_desc = posts(:post_2).description
    assert_equal("Riley", @post_1_poster)
    assert_equal("memes4dayz", @post_2_desc)
  end

  test "should not save post without poster" do
    post = Post.new
    assert !post.save
  end

  test "should not save post without description" do
    post = Post.new
    assert !post.save
  end
end
