require 'rails_helper'


describe Api::V1::SessionsController, type: :api do

	#user= User.new(username: "joe", email: "joe@myumanitoba.ca", password: "12345678", password_confirmation: "12345678")
	#let!(:user) { FactoryBot.create(:user, email: "joe@myumanitoba.ca", password: "12345678") }

	#describe "POST /api/v1/login" do
		#before do
			#params =   {email: "joe@myumanitoba.ca", password: "12345678"}

			#post '/api/v1/login', {session:  {email: "joe@myumanitoba.ca", password: "12345678"}}

		#end

		#it_returns_status(201)
		
	#end

	describe "POST /api/v1/login" do
		let!(:user) { FactoryBot.create(:user) }
		let(:u_email) { user.email }

		before do
			@user = user
		end

		context "when credentials are valid" do
			before do
				credentials =  {email: u_email, password: "12345678"}
				post 'api/v1/login', session: credentials
			end
			it_returns_status(201)
		end

		context "when credentials are invalid" do
			before do
				credentials =  {email: u_email, password: "123456789"}
				post 'api/v1/login', session: credentials
			end
			it_returns_status(401)

		end
		
	end



end