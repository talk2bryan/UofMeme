require 'rails_helper'

RSpec.configure do |config|
  config.render_views = true
end

describe Api::V1::PostsController, type: :api do 

	describe "GET /api/v1/posts/:id" do 
		let!(:user) { FactoryBot.create(:user) }
		let(:user_id) { user.id }
		let!(:post){FactoryBot.create(:post, user_id: user_id)}
		let(:post_id) { post.id }

		context "return the post if it exists" do

			before do
				get "http://api.domain.com/v1/posts/#{post_id}", format: :json
			end

			it_returns_status(200)

		end

		context "Returns Not Found if it doesn't exist" do
			before do
				get "http://api.domain.com/v1/posts/33" 
			end

			it_returns_status(404)
		end
	end

	describe "POST api/v1/posts#create  /api/v1/posts" do

		let!(:user) { FactoryBot.create(:user) }
		let(:user_id) { user.id }

		context "should return successful if post is created" do

		end
	end
	
end