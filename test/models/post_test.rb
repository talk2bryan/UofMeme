require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post creation" do
    @post_1_poster = posts(:post_1).poster
    @post_2_desc = posts(:post_2).description
    assert_equal("Riley", @post_1_poster)
    assert_equal("memes4dayz", @post_2_desc)
  end
end
