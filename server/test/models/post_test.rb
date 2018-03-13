require './test/test_helper'

class PostTest < ActiveSupport::TestCase
  test 'all fixture posts are saved in db' do
    @valid = Post.find_by_poster 'meme man'
    @no_poster = Post.find_by_description 'I have no name'
    @no_desc = Post.find_by_poster 'mute man'

    assert @valid, 'did not find post: valid_post'
    assert @no_poster, 'did not find post: no_poster'
    assert @no_desc, 'did not find post: no_description'
  end

  test 'do not save blank post' do
    @blank_post = Post.new
    assert_not @blank_post.save,'should not be allowed to save blank post'
  end
end
