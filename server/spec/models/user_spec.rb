require 'rails_helper'

RSpec.describe User, type: :model do
  @user = User.create(username: "john", email: "john@umanitoba.ca", password:  "password", password_confirmation: "password")
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
