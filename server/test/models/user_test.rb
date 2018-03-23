require './test/test_helper'

class UserTest < ActiveSupport::TestCase
  test 'do not save blank user' do
       @blank = User.new
       assert_not @blank.save, 'should not be allowed to save blank user'
  end

end
