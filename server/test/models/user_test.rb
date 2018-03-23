require './test/test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@validUsername = 'memememe'
		@validEmail = 'user@myumanitoba.ca'
		@validPassword = 'Password'

		# @validUser's email domain is myumanitoba.ca
		@validUser = User.new(username: @validUsername, email: @validEmail, password: @validPassword, password_confirmation: @validPassword)
		# @validUser2's email domain is umanitoba.ca
		@validUser2 = User.new(username: 'mickeymouse', email: 'mmouse@umanitoba.ca', password: 'iloveminnie', password_confirmation: 'iloveminnie')
	end


	test 'valid user' do
		assert @validUser.save
		assert @validUser2.save
	end

	test 'invalid username' do
		user = User.new(email: @validEmail, password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'missing username'

		user = User.new(username: '', email: @validPassword, password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'username cannot be empty string'

		user = User.new(username: 'me', email: @validEmail, password: @validPassword, password_confirmation: @validPassord)
		assert_not user.save, 'username is too short'

		user = User.new(username: 'mememememememememememememememememe', email: @validEmail, password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'username is too long'

		@validUser.save
		user = User.new(username: @validUser.username, email: @validEmail, password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'Using exact same username'

		user = User.new(username: @validUser.username.upcase, email: @validEmail, password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'Using duplicated username but upper case'

		user = User.new(username: @validUser.username.downcase, email: @validEmail, password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'Using duplicated usernmae but lower case'
	end

	test 'invalid email' do
		user = User.new(username: @validUsername, password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'Missing email'

		user = User.new(username: @validUsername, email: '', password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'email cannot be empty string'

		user = User.new(username: @validUsername, email: 'memememe', password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'Invalid email address format'

		# Not a valid email domain
		user = User.new(username: @validUsername, email: 'memememe@gmail.com', password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'not a valid email domain'

		user = User.new(username: @validUsername, email: '@myumanitoba.ca', password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'Missing username in the email address'

		longUser = "a" * 255
		user = User.new(username: @validUsername, email: longUser+'myumanitoba.ca', password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'Email address is too long'

		@validUser.save
		user = User.new(username: @validUsername, email: @validUser.email, password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'Using exact same email'

		user = User.new(username: @validUsername, email: @validUser.email.upcase, password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'Using duplicated email address but in upper case'
		user = User.new(username: @validUsername, email: @validUser.email.downcase, password: @validPassword, password_confirmation: @validPassword)
		assert_not user.save, 'Using duplicated email address but in down case'
	end

	test 'invalid password' do
		user = User.new(username: @validUsername, email: @validEmail, password_confirmation: @validPassword)
		assert_not user.save, 'Missing password'

		user = User.new(username: @validUsername, email: @validEmail, password: @validPassword)
		assert_not user.save, 'Missing password_confirmation'

		user = User.new(username: @validUsername, email: @validEmail)
		assert_not user.save, 'Missing password and password_confirmation'

		user = User.new(username: @validUsername, email: @validEmail, password: '', password_confirmation: @validPassword)
		assert_not user.save, 'Empty string for password'

		user = User.new(username: @validUsername, email: @validEmail, password: @validPassword, password_confirmation: '')
		assert_not user.save, 'Empty string for password_confirmation'

		user = User.new(username: @validUsername, email: @validEmail, password: '', password_confirmation: '')
		assert_not user.save, 'Empty string for password and password_confirmation'

		user = User.new(username: @validUsername, email: @validEmail, password: '123', password_confirmation: '123')
		assert_not user.save, 'same password and password_confirmation by the length is too short'

		user = User.new(username: @validUsername, email: @validEmail, password: '12345678', password_confirmation: '123')
		assert_not user.save, 'password is long enough but password_confirmation is too short'

		user = User.new(username: @validUsername, email: @validEmail, password: '123', password_confirmation: '12345678')
		assert_not user.save, 'password_confirmation is long enough but password is too short'

		user = User.new(username: @validUsername, email: @validEmail, password: @validPassword, password_confirmation: @validPassword.downcase)
		assert_not user.save, 'password_confirmation is all in downcase and it does not match password'

		user = User.new(username: @validUsername, email: @validEmail, password: @validPassword, password_confirmation: @validPassword.upcase)
		assert_not user.save, 'password_confirmation is all in upper case and it does not match password'

		user = User.new(username: @validUsername, email: @validEmail, password: @validPassword.downcase, password_confirmation: @validPassword)
		assert_not user.save, 'password is all in downcase and it does not match password'

		user = User.new(username: @validUsername, email: @validEmail, password: @validPassword.upcase, password_confirmation: @validPassword)
		assert_not user.save, 'password is all in upper case and it does not match password_confirmation'
	end

	test 'do not save blank user' do
		user = User.new
		assert_not user.save, 'should not be allowed to save blank user'
	end
end
