require "rails_helper"
require "pp"

describe "Posts API" do

	it 'creates a post' do
		user = create(:user)
		user_id = user.id
		post = create(:post, user_id: user_id)
		post_id = post.id

		pp post_id
		# pp JSON

		get "/api/v1/posts/#{post_id}/"

		json = response_body['post']

		pp json['uploaded_image_for_io_adapters']


		# test for the 200 status code
		expect(response).to be_successful

		# check that the user attr are the same.
		expect(json['user_id']).to eq(user_id)

		# ensure that private attr are not serialized
		expect(json['private_attr']).to eq(nil)
	end
	def response_body
		JSON.parse(response.body)
  	end
end