require './test/test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
	include FactoryBot::Syntax::Methods
	include SignInHelper

  	test "can create a post" do  	
  		user = build :user	
  		sign_in_as user
  	end
end
