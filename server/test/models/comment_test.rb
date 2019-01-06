require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'all fixture comments are saved in db' do
    @valid = Comment.find_by_commenter 'john'
    @no_name = Comment.find_by_description 'My identity was stolen'
    @no_desc = Comment.find_by_commenter 'opinion man'

    assert @valid, 'did not find comment: valid_comment'
    assert @no_name, 'did not find comment: no_commenter'
    assert @no_desc, 'did not find comment: no_description'
  end

  test 'do not save blank comment' do
    @blank_comment = Comment.new
    assert_not @blank_comment.save,'should not be allowed to save blank comment'
  end
end
