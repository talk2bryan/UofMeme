require 'rails_helper'
require 'spec_helper'

describe Post do
  it 'has a valid factory' do
    expect(build(:post, :with_image)).to be_valid
  end

  describe 'ActiveModel validations' do
    let(:post) { create :post, :with_image }
    
    # Basic validations
    it { should validate_presence_of(:poster) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:image) }
  end

  describe 'ActiveRecord associations' do
    let(:post) { create :post_with_gif, :with_image }
    
    context 'when comment is created' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to have_many(:likes).dependent(:destroy) }
      it { is_expected.to have_many(:dislikes).dependent(:destroy) }
      it { is_expected.to have_many(:comments).dependent(:destroy) }
    end
  end
end
