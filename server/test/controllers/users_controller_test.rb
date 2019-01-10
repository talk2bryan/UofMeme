		require './test/test_helper'

		class UsersControllerTest < ActionDispatch::IntegrationTest
			test "can create a new valid user" do
				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username: "new_user", email: "newuser@myumanitoba.ca", password:"password1" } }
				assert_response :success
			end

			test "cannot create a user with blank username" do
				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username: "", email: "newuser@myumanitoba.ca", password:"password2" } }
				assert_select 'div#error_description'
		    	assert_select 'div.alert.alert-danger'
		    	assert_select 'li', { :count=>1, :text=>"Username can't be blank" }
			end

			test "cannot create a user with blank email" do
				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username: "new_user1", email: "", password:"password3" } }
				assert_select 'div#error_description'
		    	assert_select 'div.alert.alert-danger'
		    	assert_select 'li', { :count=>1, :text=>"Email can't be blank" }
			end

			test "cannot create a new user with blank password" do
				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username: "student", email: "student@myumanitoba.ca", password:"" } }
				assert_select 'div#error_description'
		    	assert_select 'div.alert.alert-danger'
		    	assert_select 'li', { :count=>1, :text=>"Password can't be blank" }
			end

			test "cannot create a new user with non-uofm email" do
				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username: "non_student", email: "nonstudent@gmail.com", password:"password4" } }
				assert_select 'div#error_description'
		    	assert_select 'div.alert.alert-danger'
		    	assert_select 'li', { :count=>1, :text=>"Email : Enter a valid uofm email address" }
			end

			test "cannot create a new user with short username" do
				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username: "st", email: "student@myumanitoba.ca", password:"validpass" } }
				assert_select 'div#error_description'
		    	assert_select 'div.alert.alert-danger'
		    	assert_select 'li', { :count=>1, :text=>"Username is too short (minimum is 3 characters)" }
			end

			test "cannot create a new user with long username" do
				@longUsername = "thisusernameismorethan30characterslonganditshouldgiveanerrorwhenyoutrytosubmit"

				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username: @longUsername, email: "student@myumanitoba.ca", password:"validPassword" } }
				assert_select 'div#error_description'
		    	assert_select 'div.alert.alert-danger'
		    	assert_select 'li', { :count=>1, :text=>"Username is too long (maximum is 30 characters)" }
			end

			test "cannot create a new user with short password" do
				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username: "student", email: "student@myumanitoba.ca", password:"pass" } }
				assert_select 'div#error_description'
		    	assert_select 'div.alert.alert-danger'
		    	assert_select 'li', { :count=>1, :text=>"Password is too short (minimum is 8 characters)" }
			end

			test "cannot create a new user with long password" do
				@longPassword = "thispasswordismorethan72characterslonganditshouldgiveanerrorwhenyoutrytosubmit"

				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username: "student", email: "student@myumanitoba.ca", password:@longPassword } }
				assert_select 'div#error_description'
		    	assert_select 'div.alert.alert-danger'
		    	assert_select 'li', { :count=>1, :text=>"Password is too long (maximum is 72 characters)" }
			end

			test "cannot create a new user with existing username" do
				@existingName = users(:user1).username
				@newName = "coolstudent"

				assert_equal @existingName, @newName

				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username: @newName, email: "student@myumanitoba.ca", password:"password10" } }
				assert_select 'div#error_description'
		    	assert_select 'div.alert.alert-danger'
		    	assert_select 'li', { :count=>1, :text=>"Username has already been taken" }
			end

			test "cannot create a new user with existing email" do
				@existingEmail = users(:user1).email
				@newEmail = "coolstudent@myumanitoba.ca"

				assert_equal @existingEmail, @newEmail

				get "/users/new"
				assert_response :success

				post "/users", params: { user: { username:"valid_name", email: @newEmail, password:"password10" } }
				assert_select 'div#error_description'
		    	assert_select 'div.alert.alert-danger'
		    	assert_select 'li', { :count=>1, :text=>"Email has already been taken" }
			end
		end
