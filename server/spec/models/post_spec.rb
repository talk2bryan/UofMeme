require 'rails_helper'
require 'spec_helper'

RSpec.describe Post, type: :model do
  # Association test
  # ensure Post model has a 1:m relationship with the Comment model
  it { should have_many(:comments).dependent(:destroy) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:poster) }
  it { should validate_presence_of(:description) }
end