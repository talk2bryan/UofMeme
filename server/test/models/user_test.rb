require './test/test_helper'

class UserTest < ActiveSupport::TestCase
	test 'valid user' do
		user = Users(:user1)
		assert user.save
	end

	test 'do not save blank user' do
		user = User.new
		assert_not user.save, 'should not be allowed to save blank user'
	end
end
