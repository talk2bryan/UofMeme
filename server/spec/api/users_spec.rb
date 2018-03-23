require 'rails_helper'


describe Api::V1::UsersController, type: :api do


	describe "POST #create" do

		before do
			#create_ user
			@user = FactoryBot.attributes_for(:user)
			post "/api/v1/users", user: @user.as_json, format: :json
		end

		it_returns_status(201)

	end



end