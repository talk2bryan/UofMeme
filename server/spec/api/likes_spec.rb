require 'rails_helper'

describe Api::V1::LikesController, type: :api do
    describe "POST api/v1/likes#create" do
        let(:user) { create(:user) }
        let(:user_id) { user.id }
        let(:user_post){create(:post, :with_image, user_id: user_id)}
        let(:post_id) { user_post.id }

        context "When parameters are valid" do
            before do
                like = {
                    user_id: user_id,
                    post_id: post_id
                }

                @like_response = likes_response(user_post, user_id, 1, 0)

                post "api/v1/likes/", like
            end

            it_returns_status(200)

            it_returns_attribute_values(resource: 'post', model: proc{@like_response}, attrs: [
                :id,
                :poster,
                :description,
                :user_id,
                :file_name,
                :like,
                :dislike
            ])
        end

        context "remove like on post if user already liked the post" do
            before do
                like = {
                    user_id: user_id,
                    post_id: post_id
                }

                @like_response = likes_response(user_post, user_id, 0, 0)

                post "api/v1/likes/", like
                post "api/v1/likes/", like
            end

            it_returns_status(200)

            it_returns_attribute_values(resource: 'post', model: proc{@like_response}, attrs: [
                :id,
                :poster,
                :description,
                :user_id,
                :file_name,
                :like,
                :dislike
            ])
        end

        context "add like on post if user already disliked the post" do
            before do
                like = {
                    user_id: user_id,
                    post_id: post_id
                }

                @like_response = likes_response(user_post, user_id, 1, 0)

                post "api/v1/dislikes/", like
                post "api/v1/likes/", like
            end

            it_returns_status(200)

            it_returns_attribute_values(resource: 'post', model: proc{@like_response}, attrs: [
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
                like = {
                    user_id: user_id,
                    post_id: 2000
                }

                @like_error_msg = {
                    errors: "That post doesn't exist"                  
                }

                post "api/v1/likes/", like
            end

            it_returns_status(422)

            it_returns_attribute_values(resource: 'errors', model: proc{@like_error_msg}, attrs: [])
        end

        context "returns an error when user doesn't exist" do
            before do
                like = {
                    user_id: 2000,
                    post_id: post_id
                }

                @like_error_msg = {
                    user: [
                        "must exist",
                        "can't be blank"
                    ]                  
                }

                post "api/v1/likes/", like
            end

            it_returns_status(422)

            it_returns_attribute_values(resource: 'errors', model: proc{@like_error_msg}, attrs: [
                :user
            ])
        end
    end

    private

    def likes_response(post, user_id, likes_count, dislikes_count)
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