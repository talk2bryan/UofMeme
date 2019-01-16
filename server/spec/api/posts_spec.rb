require 'rails_helper'

describe Api::V1::PostsController, type: :api do
    describe "GET api/v1/posts#show" do
        context "get a specific post" do
            let(:user) { create(:user) }
			let(:user_id) { user.id }
			let(:post){create(:post, :with_image ,user_id: user_id)}
            let(:post_id) { post.id }
            
            before do
                get "/api/v1/posts/#{post_id}"
            end

            it_returns_status(200)
        end
    end
end