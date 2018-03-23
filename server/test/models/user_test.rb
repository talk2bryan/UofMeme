require './test/test_helper'

class UserTest < ActiveSupport::TestCase
	setup do
		# @validUser's email domain is myumanitoba.ca
		@validUser = User.new(username: 'memememe', email: 'memememe@myumanitoba.ca', password: 'memememe', password_confirmation: 'memememe')
		# @validUser2's email domain is umanitoba.ca
		@validUser2 = User.new(username: 'mickeymouse', email: 'mmouse@umanitoba.ca', password: 'iloveminnie', password_confirmation: 'iloveminnie')
	end


	test 'valid user' do
		assert @validUser.save
		assert @validUser2.save
	end

	test 'do not save blank user' do
		user = User.new
		assert_not user.save, 'should not be allowed to save blank user'
	end
end
