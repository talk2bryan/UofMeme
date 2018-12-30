require './test/test_helper'

class LikesTest < ActiveSupport::TestCase
def setup@ user = users(: user1)#@ post = posts(: valid_post)@ post = Post.new@ post.poster = 'mmmmmmmm'@
post.image = File.new("test/fixtures/files/test.png")@ post.description = "my mememe"@
post.user_id = @user.id
assert@ post.save
end

test 'Testing null like input'
do
  like = Like.new
assert_not like.save
end

test 'Testing valid like input'
do
  like = Like.new(user_id: @user.id, post_id: @post.id)
assert like.save
end

test 'Testing invalid post_id input'
do
  like = Like.new(user_id: @user.id)
assert_not like.save

like = Like.new(user_id: @user.id, post_id: 123)
assert_not like.save

like = Like.new(user_id: @user.id, post_id: "")
assert_not like.save

end

test 'Testing invalid user_id input'
do
  like = Like.new(post_id: @post.id)
assert_not like.save

like = Like.new(user_id: 123, post_id: @post.id)
assert_not like.save

like = Like.new(user_id: "", post_id: @post.id)
end

test 'should report error'
do
  assert_raises(NameError) do
    some_undefined_variable
  end
end


end