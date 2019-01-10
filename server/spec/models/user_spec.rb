  require 'rails_helper'

  RSpec.describe User, type: :model do
    subject {described_class.new(username: "joe", email: "joe@myumanitoba.ca",
       password: "12345678", password_confirmation: "12345678")}

      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

      it "is not valid without a username"do
        subject.username = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without an email"do
        subject.email = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a password"do
        subject.password = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a password confirmation"do
        subject.password_confirmation = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a myumanitoba.ca/umanitoba.ca email"do
        subject.email = "joe@gmail.com"
        expect(subject).to_not be_valid
      end

      it "is not valid if password length less than 8"do
        subject.password = "123456"
        subject.password_confirmation = "123456"
        expect(subject).to_not be_valid
      end

      it "is not valid if password and password_confirmation are different"do
        subject.password = "12345678"
        subject.password_confirmation = "123456789"
        expect(subject).to_not be_valid
      end


  end
