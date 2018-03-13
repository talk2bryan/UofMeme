require 'rails_helper'

RSpec.describe Dislike, type: :model do
   	subject {described_class.new(username: "joe", postid: 1) }

    it "is valid with valid attributes" do
    	expect(subject).to be_valid
  	end

  	it "is not valid without a username"do
  		subject.username = nil
  		expect(subject).to_not be_valid
	end

	it "is not valid without a post id"do
  		subject.postid = nil
  		expect(subject).to_not be_valid
	end
	it "is not valid if post id is not a number"do
  		subject.postid = "aw"
  		expect(subject).to_not be_valid
	end
end
