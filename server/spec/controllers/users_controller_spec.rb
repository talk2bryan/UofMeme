require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe "GET #new" do
		it "returns http success" do
			get :new
			expect(response).to be_successful
			expect(response).to have_http_status(200)
		end
	end

	describe "GET #index" do
		it "returns http success" do
			get :index
			expect(response).to be_successful
			expect(response).to have_http_status(200)
		end
	end

	describe "show" do
		it "returns http success" do
		 	:show
			expect(response).to be_successful
			expect(response).to have_http_status(200)
		end
	end

	describe "POST #create" do
		it "redirects to the root url, indicating success" do
			params = { user: { username: "John" , email: "John@myumanitoba.ca", password: "12345678",password_confirmation: "12345678"} }
			post :create, params: params
			expect(response).to redirect_to root_url
		end

		it "redirects to re-render the sign up page, indicating failure" do
			params = { user: { username: "John" , email: "John@myumanitoba.ca", password: "1245678",password_confirmation: "12345678"} }
			post :create, params: params
			expect(response).to be_successful
			expect(response).to have_http_status(200)
		end
	end


	describe "POST #new" do
		it "returns http success" do
			post :new
			expect(response).to be_successful
			expect(response).to have_http_status(200) 
		end
	end

end
