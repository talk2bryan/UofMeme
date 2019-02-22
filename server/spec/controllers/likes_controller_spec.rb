require 'rails_helper'
include SessionsHelper

RSpec.describe LikesController, type: :controller do
    render_views
    
    describe "POST #create" do
        let(:user) { create(:user) }
        let(:user_id) { user.id }        
        let(:user_post){create(:post, :with_image, user_id: user_id)}
        let(:post_id) { user_post.id }

        it "renders the likes partial, indicating success" do
            params = {user_id: user_id, post_id: post_id, like_id: post_id}
            log_in(user)
            post :create, :format => 'js', params: params
            log_out

            expect(response).to be_successful
			expect(response).to have_http_status(200)
            expect(response).to render_template(partial: 'posts/_likes')
        end

        it "should fail redirecting to the root url, when user is not logged in" do
            params = {user_id: user_id, post_id: post_id, like_id: post_id}
            post :create, :format => 'js', params: params

            expect(response).to redirect_to root_url
        end

        it "should fail redirecting to the root url, when post does not exist" do
            post_id = 1423456789

            params = {user_id: user_id, post_id: post_id, like_id: post_id}
            log_in(user)
            post :create, :format => 'js', params: params
            log_out

            expect(response).to redirect_to root_url
        end

        it "should fail redirecting to the root url, when user does not exist" do
            user_id = 10000
            
            params = {user_id: user_id, post_id: post_id, like_id: post_id}
            log_in(user)
            post :create, :format => 'js', params: params
            log_out

            expect(response).to redirect_to root_url
        end
    end
end
