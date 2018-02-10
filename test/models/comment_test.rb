require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "comment creation" do
    @comment_1_desc = comments(:comment_1).description
    @comment_2_commenter = comments(:comment_2).commenter
    assert_equal("Get off my lawn", @comment_1_desc)
    assert_equal("Franklin", @comment_2_commenter)
  end
end
