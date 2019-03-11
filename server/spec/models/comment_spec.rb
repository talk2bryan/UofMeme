require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { described_class.new}

  it "is valid with valid attributes" do
    subject.comment_id=1
    subject.post_id=3
    subject.user_id=2
    subject.commenter="Anything"
    subject.comment="Anything"

    subject.timeAttribute=DateTime.now
    expect(subject).to be_valid
  end
  it "is not valid without a commenter" do

    expect(subject).to_not be_valid
  end



end
