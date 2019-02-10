require 'rails_helper'
require 'base64'

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

    describe "POST api/v1/posts#create" do
        let(:user) { create(:user) }
        let(:user_id) { user.id }

        context "when parameters are valid" do

            before do
                image = fixture_file_upload("files/mememan.jpg", "image/jpg")
                file_path = Rails.root.join('app', 'assets', 'images', 'mememan.jpg')
                base64_image = Base64.encode64(open(file_path) {|io| io.read})
                newPost = {
                    post: { 
                        poster: "ace",
                        description: "Just a test",
                        user_id: user_id,
                        file_name: "mymeme.jpg",
                        uploaded_image_for_io_adapters: base64_image
                    }
                }

                @post_response = {
                    poster: "ace",
                    description: "Just a test",
                    user_id: user_id,
                    file_name: "mymeme.jpg",
                    like: 0,
                    dislike: 0
                }

                post "api/v1/posts/", newPost.as_json                
            end

            it_returns_status(201)

            it_returns_attribute_values(resource: 'post', model: proc{@post_response}, attrs: [
                :poster,
                :description,
                :user_id,
                :file_name,
                :like,
                :dislike
            ])
        end

        context "when parameters are incomplete: missing poster value" do
            before do
                image = fixture_file_upload("files/mememan.jpg", "image/jpg")
                file_path = Rails.root.join('app', 'assets', 'images', 'mememan.jpg')
                base64_image = Base64.encode64(open(file_path) {|io| io.read})
                newPost = {
                    post: { 
                        description: "Just a test",
                        user_id: user_id,
                        file_name: "mymeme.jpg",
                        uploaded_image_for_io_adapters: base64_image
                    }
                }

                @post_error_msg = {
                    poster: ["can't be blank"]                   
                }

                post "api/v1/posts/", newPost.as_json                
            end

            it_returns_status(422)

            it_returns_attribute_values(resource: 'errors', model: proc{@post_error_msg}, attrs: [
                :poster
            ])

            context "when parameters are incomplete: missing description value" do
                before do
                    image = fixture_file_upload("files/mememan.jpg", "image/jpg")
                    file_path = Rails.root.join('app', 'assets', 'images', 'mememan.jpg')
                    base64_image = Base64.encode64(open(file_path) {|io| io.read})
                    newPost = {
                        post: { 
                            poster: "ace",
                            user_id: user_id,
                            file_name: "mymeme.jpg",
                            uploaded_image_for_io_adapters: base64_image
                        }
                    }
    
                    @post_error_msg = {
                        description: ["can't be blank"]                   
                    }
    
                    post "api/v1/posts/", newPost.as_json                
                end
    
                it_returns_status(422)
    
                it_returns_attribute_values(resource: 'errors', model: proc{@post_error_msg}, attrs: [
                    :description
                ])
            end

            context "when parameters are incomplete: missing user_id value" do
                before do
                    image = fixture_file_upload("files/mememan.jpg", "image/jpg")
                    file_path = Rails.root.join('app', 'assets', 'images', 'mememan.jpg')
                    base64_image = Base64.encode64(open(file_path) {|io| io.read})
                    newPost = {
                        post: { 
                            poster: "ace",
                            description: "Just a test",
                            file_name: "mymeme.jpg",
                            uploaded_image_for_io_adapters: base64_image
                        }
                    }
    
                    @post_error_msg = {
                        user_id: ["can't be blank"]                   
                    }
    
                    post "api/v1/posts/", newPost.as_json                
                end
    
                it_returns_status(422)
    
                it_returns_attribute_values(resource: 'errors', model: proc{@post_error_msg}, attrs: [
                    :user_id
                ])
            end

            context "when parameters are incomplete: missing file_name value" do
                before do
                    image = fixture_file_upload("files/mememan.jpg", "image/jpg")
                    file_path = Rails.root.join('app', 'assets', 'images', 'mememan.jpg')
                    base64_image = Base64.encode64(open(file_path) {|io| io.read})
                    newPost = {
                        post: { 
                            poster: "ace",
                            description: "Just a test",
                            user_id: user_id,
                            uploaded_image_for_io_adapters: base64_image
                        }
                    }
    
                    @post_error_msg = {
                        image: ["can't be blank"]                   
                    }
    
                    post "api/v1/posts/", newPost.as_json                
                end
    
                it_returns_status(422)
    
                it_returns_attribute_values(resource: 'errors', model: proc{@post_error_msg}, attrs: [
                    :image
                ])
            end

            context "when parameters are incomplete: missing uploaded_image_for_io_adapters (image) value" do
                before do
                    newPost = {
                        post: { 
                            poster: "ace",
                            description: "Just a test",
                            user_id: user_id,
                            file_name: "mymeme.jpg",
                        }
                    }
    
                    @post_error_msg = {
                        image: ["can't be blank"]                   
                    }
    
                    post "api/v1/posts/", newPost.as_json                
                end
    
                it_returns_status(422)
    
                it_returns_attribute_values(resource: 'errors', model: proc{@post_error_msg}, attrs: [
                    :image
                ])
            end

            context "when encoded image parameter is not an image" do
                before do
                    newPost = {
                        post: { 
                            poster: "ace",
                            description: "Just a test",
                            user_id: user_id,
                            file_name: "mymeme.jpg",
                            uploaded_image_for_io_adapters: "should be an image"
                        }
                    }
    
                    @post_error_msg = {
                        image: ["can't be blank"]                   
                    }
    
                    post "api/v1/posts/", newPost.as_json                
                end
    
                it_returns_status(422)
    
                it_returns_attribute_values(resource: 'errors', model: proc{@post_error_msg}, attrs: [
                    :image
                ])
            end

        end
    end
end