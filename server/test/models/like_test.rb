require 'test_helper'

class LikesTest < ActiveSupport::TestCase
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
  
  test 'should not save like without user and post id' do
    like = Like.new
    assert_not like.save
  end

  test 'should save like with valid params' do
    like = Like.new(user_id: @user.id, post_id: @post.id)
    assert like.save!
  end
  test 'should report error' do
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
