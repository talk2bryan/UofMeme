require 'rails_helper'

RSpec.describe Like, type: : model do

    subject {
    described_class.new(user_id: 1, post_id: 1)
  }

it "is not valid without a user or post related to the given ids"
do
  expect(subject).to_not be_valid
end


end