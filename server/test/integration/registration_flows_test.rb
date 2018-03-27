require "test_helper"

class RegistrationFlowsTest < ActionDispatch::IntegrationTest
	test 'test register template rendered' do
		get '/users/new'
		assert_response :success
		assert_template "users/new"
	end

	test 'test successful registration' do
		get '/users/new'
		assert_response :success

		post '/users', params: { user: { username: "mememe", email: "mememe@myumanitoba.ca", password: "12345678", password_confirmation: "12345678" } }
		assert_response :redirect
		assert_equal "/users", path
	end
end
