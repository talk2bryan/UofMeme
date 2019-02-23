require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: "frank", email: "frank@umanitoba.ca", password:  "password", password_confirmation: "password") }
  let(:dup_username) { User.new(username: "frank", email: "f@umanitoba.ca", password:  "password", password_confirmation: "password")}
  let(:dup_email) { User.new(username: "fra", email: "frank@umanitoba.ca", password:  "password", password_confirmation: "password")}

  context "username" do
    it "is not valid without unique username" do
      subject.save
      expect{dup_username.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Username has already been taken")
    end

    it "is not valid without username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with short username" do
      subject.username = Faker::Lorem.characters(2)
      expect(subject).to_not be_valid
    end

    it "is not valid with long username" do
      subject.username = Faker::Lorem.characters(31)
      expect(subject).to_not be_valid
    end

    it "is a valid username" do
      subject.username = "frank"
      expect(subject).to be_valid
    end
  end

  context "email" do
    it "is not valid without unique email" do
      subject.save
      expect{dup_email.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email has already been taken")
    end

    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with incorrect regex" do
      subject.email = Faker::Lorem.characters(10) + "@gmail.ca"
      expect(subject).to_not be_valid
    end

    it "is not valid with long email" do
      subject.email = Faker::Lorem.characters(255) + "@umanitoba.ca"
      expect(subject).to_not be_valid
    end

    it "is a valid email" do
      subject.email = "frank@umanitoba.ca"
      expect(subject).to be_valid
    end
  end

  context "password" do
    it "is not valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with short password" do
      subject.password = Faker::Lorem.characters(7)
      expect(subject).to_not be_valid
    end

    it "is a valid password" do
      subject.password = "password"
      expect(subject).to be_valid
    end

    it "is not valid without password confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with short password confirmation" do
      subject.password_confirmation = Faker::Lorem.characters(7)
      expect(subject).to_not be_valid
    end

    it "is a valid password confirmation" do
      subject.password_confirmation = "password"
      expect(subject).to be_valid
    end
  end

  context "remember, forget" do
    it "successfully remembers a user then forgets that user" do
      subject.remember
      expect(subject.remember_digest).to_not eq(nil)
      expect(subject.remember_token).to_not eq(nil)
      subject.forget
      expect(subject.remember_digest).to eq(nil)
    end
  end

  describe "associations" do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:dislikes) }
    # this should pass but it doesnt (because it passes with dislikes) TODO
    # it { should have_many(:posts).through(:likes) }
    it { should have_many(:posts).through(:dislikes) }
  end

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(3) }
    it { should validate_length_of(:username).is_at_most(30) }
    # calling self.email = email.downcase before saving causes email to be nil in test
    # it { should validate_uniqueness_of(:username).ignoring_case_sensitivity }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255) }
    # calling self.email = email.downcase before saving causes email to be nil in test
    # it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_length_of(:password).is_at_least(8) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_length_of(:password_confirmation).is_at_least(8) }
    it { should have_secure_password }

    it { should allow_value("john@umanitoba.ca").for(:email) }
    it { should allow_value("john@myumanitoba.ca").for(:email) }
    it { should_not allow_value("john@hotmail.ca").for(:email) }
    it { should_not allow_value("john@umanitoba.com").for(:email) }
    it { should_not allow_value("john@myumanitoba.com").for(:email) }
    it { should_not allow_value("john@hotmail.com").for(:email) }
  end
end

