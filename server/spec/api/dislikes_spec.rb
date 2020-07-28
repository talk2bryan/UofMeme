require 'rails_helper'

describe Api::V1::DislikesController, type: :api do
    describe "POST api/v1/dislikes#create" do
        let(:user) { create(:user) }
        let(:user_id) { user.id }
        let(:user_post){create(:post, :with_image, user_id: user_id)}
        let(:post_id) { user_post.id }

        context "When parameters are valid" do
            before do
                dislike = {
                    user_id: user_id,
                    post_id: post_id
                }

                @dislike_response = dislikes_response(user_post, user_id, 0, 1)

                post "api/v1/dislikes/", dislike
            end

            it_returns_status(200)

            it_returns_attribute_values(resource: 'post', model: proc{@dislike_response}, attrs: [
                :id,
                :poster,
                :description,
                :user_id,
                :file_name,
                :like,
                :dislike
            ])
        end

        context "remove dislike on post if user already disliked the post" do
            before do
                dislike = {
                    user_id: user_id,
                    post_id: post_id
                }

                @dislike_response = dislikes_response(user_post, user_id, 0, 0)

                post "api/v1/dislikes/", dislike
                post "api/v1/dislikes/", dislike
            end

            it_returns_status(200)

            it_returns_attribute_values(resource: 'post', model: proc{@dislike_response}, attrs: [
                :id,
                :poster,
                :description,
                :user_id,
                :file_name,
                :like,
                :dislike
            ])
        end

        context "add dislike on post if user already liked the post" do
            before do
                dislike = {
                    user_id: user_id,
                    post_id: post_id
                }

                @dislike_response = dislikes_response(user_post, user_id, 0, 1)

                post "api/v1/likes/", dislike
                post "api/v1/dislikes/", dislike
            end

            it_returns_status(200)

            it_returns_attribute_values(resource: 'post', model: proc{@dislike_response}, attrs: [
                :id,
                :poster,
                :description,
                :user_id,
                :file_name,
                :like,
                :dislike
            ])
        end

        context "returns an error when post doesn't exist" do
            before do
                dislike = {
                    user_id: user_id,
                    post_id: 2000
                }

                @dislike_error_msg = {
                    errors: "That post doesn't exist"                  
                }

                post "api/v1/dislikes/", dislike
            end

            it_returns_status(422)

            it_returns_attribute_values(resource: 'errors', model: proc{@dislike_error_msg}, attrs: [])
        end

        context "returns an error when user doesn't exist" do
            before do
                dislike = {
                    user_id: 2000,
                    post_id: post_id
                }

                @dislike_error_msg = {
                    user: [
                        "must exist",
                        "can't be blank"
                    ]                  
                }

                post "api/v1/dislikes/", dislike
            end

            it_returns_status(422)

            it_returns_attribute_values(resource: 'errors', model: proc{@dislike_error_msg}, attrs: [
                :user
            ])
        end
    end

    private

    def dislikes_response(post, user_id, likes_count, dislikes_count)
        {
            id: post.id,
            poster: post.poster,
            description: post.description,
            user_id: user_id,
            file_name: post.file_name,
            like: likes_count,
            dislike: dislikes_count
        }
    end
end