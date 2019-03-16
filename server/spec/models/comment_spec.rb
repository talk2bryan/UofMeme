require 'rails_helper'
require "time"

RSpec.describe Comment, type: :model do
  subject {described_class.new }

  it "is valid with valid attributes" do
    subject.comment="Anything"
    subject.commenter="Anything"
    subject.created_at=Time.parse("Dec 8 2015 10:19")
    subject.updated_at=Time.parse("Dec 8 2015 20:19")


  end
  it "is not valid without a commenter" do
    subject.commenter=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a comment" do
    subject.comment=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a created time" do
    subject.created_at=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a updated time" do
    subject.updated_at=nil
    expect(subject).to_not be_valid
  end



end
