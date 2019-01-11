require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "association" do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  describe "validation" do
    it { should validate_presence_of(:commenter) }
  end
end
