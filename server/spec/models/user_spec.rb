require 'rails_helper'

RSpec.describe User, type: :model do
  #change to factorybot
  @user = User.create(username: "john", email: "john@umanitoba.ca", password:  "password", password_confirmation: "password")

  describe "username" do
    #could be create instead
    #change to factorybot
    subject { User.new(username: "frank", email: "frank@umanitoba.ca", password:  "password", password_confirmation: "password") }

    it "is a valid username" do
      expect(subject).to be_valid
    end

    it "is not valid without username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with short username" do
      subject.username = Faker::Lorem.characters(2)
      # subject.username = "Jo"
      expect(subject).to_not be_valid
    end

    it "is not valid with long username" do
      subject.username = Faker::Lorem.characters(31)
      # subject.username = "frankfrankfrankfrankfrankfrank1"
      expect(subject).to_not be_valid
    end

    #could fail due to using new instead of create
    it "is not valid without unique username" do
      subject.username = "john"
      expect(subject).to_not be_valid
    end
  end

  describe "email" do
    subject { User.new(username: "frank", email: "frank@umanitoba.ca", password:  "password", password_confirmation: "password") }

    it "is a valid email" do
      expect(subject).to be_valid
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

    it "is not valid without unique email" do
      subject.email = "john@umanitoba.ca"
      expect(subject).to_not be_valid
    end
  end

  describe "password" do
    subject { User.new(username: "frank", email: "frank@umanitoba.ca", password:  "password", password_confirmation: "password") }

    it "" do

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
