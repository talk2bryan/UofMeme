require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "association" do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:dislikes).dependent(:destroy) }
  end

  describe "validation" do
    it { should validate_presence_of(:image) }
    # ruby 5 does not have a matcher for content types; do manually
    # it { should allow_content_type('image/jpeg').for(:image) }
    it { should validate_presence_of(:poster) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:user_id) }
  end
end
