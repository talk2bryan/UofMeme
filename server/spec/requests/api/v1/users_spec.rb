require "rails_helper"

describe "Users API" do
	it 'creates a list of users' do

		create_list(:user, 10)

		get '/api/v1/users'
		# test for the 200 status code
		expect(response).to be_successful
	end

	it 'retrieves a particular user' do
		user = create(:user)
		get "/api/v1/users/#{user.id}"

		json = response_body['user']

		# test for the 200 status code
		expect(response).to be_successful

		# check that the user attr are the same.
		expect(json['id']).to eq(user.id)

		# ensure that private attr are not serialized
		expect(json['private_attr']).to eq(nil)
	end
	def response_body
		JSON.parse(response.body)
  	end
end