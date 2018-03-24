require 'rails_helper'

describe Api::V1::SessionsController, type: :api do
	describe "POST /api/v1/login" do
		let(:user) { create(:user) }
		let(:u_email) { user.email }

		before do
			@user = user
		end

		context "when credentials are valid" do
			before do
				credentials =  {email: u_email, password: "12345678"}
				post 'http://api.domain.com/v1/login', session: credentials
			end
			it_returns_status(201)
		end

		context "when credentials are invalid" do
			before do
				credentials =  {email: u_email, password: "123456789"}
				post 'http://api.domain.com/v1/login', session: credentials
			end
			it_returns_status(401)

		end
		
	end



end