require 'rails_helper'

describe Api::V1::SessionsController, type: :api do
	describe "POST /api/v1/login" do
		let(:user) { create(:user, email: "jj@myumanitoba.ca", password: "12345678", password_confirmation: "12345678") }
		let(:u_email) { user.email }

		context "when credentials are valid" do
			before do
				credentials =  {email: u_email, password: "12345678"}
				post '/api/v1/login',  credentials.as_json
			end
			it_returns_status(201)


		end

		context "when credentials are invalid" do
			before do
				credentials =  {email: u_email, password: "123456789"}
				post '/api/v1/login',  credentials.as_json
			end
			it_returns_status(401)

		end
		
	end



end