  require_relative '../config/environment'
  require 'rails/test_help'
  require 'capybara'
  require 'capybara/dsl'

  class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

  module SignInHelper
  def sign_in_as(user)
    post "/login", params: { session: { email: user.email, password: user.password } }
  end
end

  class ActionDispatch::IntegrationTest
  include SignInHelper
end
