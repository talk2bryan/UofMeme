require "test_helper"

class LoginTest < ActionDispatch::IntegrationTest
	def setup
	@user = User.new(username: "mememe",
	email: "mememe@myumanitoba.ca", password: "12345678",
	password_confirmation: "12345678")
	@user.save
	end

	test 'attempt to login with empty input' do
		# get the login page
	get "/login"
	assert_equal 200, status

		# post the login and follow through to the home page
	post "/login", params: { session: {email: '',
	password: '', remember_me: '1'} }
	assert_equal 200, status
	assert_equal "/login", path
	assert_equal "Invalid email/password combination", flash[:danger]
	end

	test 'test successful login' do
	get "/login"
	assert_equal 200, status

	post "/login", params: { session: {email: @user.email,
	password: @user.password, remember_me: '1'} }
	assert_response :redirect
	assert_equal "/login", path
	end
end
