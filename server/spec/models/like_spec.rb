require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "association" do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  describe "validation" do
    it { should validate_presence_of(:post) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:post_id) }
  end
end
