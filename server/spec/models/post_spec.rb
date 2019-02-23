require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user) { User.new(username: "frank", email: "frank@umanitoba.ca", password:  "password", password_confirmation: "password")}
  let(:image_path) { Rails.root.join('app', 'assets', 'images', 'mememan.jpg')}
  let(:image) { fixture_file_upload(image_path, 'image/jpg') }
  subject { Post.new(poster: user, image: image, description: "Memes", user_id: user.id, top_text: "memes", bot_text: "are cool") }

  context "post" do
    it "is a valid post" do
      user.save
      subject.save
      expect(subject).to be_valid
    end
  end

  describe "association" do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:dislikes).dependent(:destroy) }
  end

  describe "validation" do
    # it { should validate_presence_of(:image) }
    # ruby 5 does not have a matcher for content types; do manually
    # it { should allow_content_type('image/jpeg').for(:image) }
    it { should validate_presence_of(:poster) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:user_id) }
  end
end
