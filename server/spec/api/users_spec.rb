require 'rails_helper'

describe Api::V1::UsersController, type:: api do

    describe "POST api/v1/users#create"
  do

    context "when parameters are valid"
  do
    before do# create_ user
    @user = attributes_for(: user, username: "John", email: "john@myumanitoba.ca", password: "12345678", password_confirmation: "12345678")
  post "/api/v1/users", @user.as_json
end

it_returns_status(201)

it_returns_no_attributes(
  resource: 'user', attrs: [: id,: name,: username]
)

end

context "when parameters are invalid: password is different from password_confirmation"
do
  before do# create_ user
  @user = attributes_for(: user, username: "John", email: "John@myumanitoba.ca", password: "1234678", password_confirmation: "12345678")
post "/api/v1/users", @user.as_json
end

it_returns_status(422)
it_returns_no_attributes(
  resource: 'user', attrs: [: id,: name,: username]
)
end

context "when parameters are invalid: email is not a muymanitoba domain"
do
  before do# create_ user
  @user = attributes_for(: user, username: "John", email: "John@mumanitoba.ca", password: "12345678", password_confirmation: "12345678")
post "/api/v1/users", @user.as_json
end

it_returns_status(422)
it_returns_no_attributes(
  resource: 'user', attrs: [: id,: name,: username]
)
end

context "when parameters are invalid: username less than 3 characters"
do
  before do# create_ user
  @user = attributes_for(: user, username: "Jo", email: "John@mumanitoba.ca", password: "12345678", password_confirmation: "12345678")
post "/api/v1/users", @user.as_json
end

it_returns_status(422)
it_returns_no_attributes(
  resource: 'user', attrs: [: id,: name,: username]
)

end

end

describe "GET api/v1/users#show"
do
  let (: user) {
    create(: user)
  }
let (: user_id) {
  user.id
}

context "gets an existing user"
do
  before do
    get "/api/v1/users/#{user_id}"
end

it_returns_status(200)

end

context "gets a non existing user"
do
  before do
    get "/api/v1/users/12"
end

it_returns_status(404)

it_returns_no_attributes(
  resource: 'user', attrs: [: id,: name,: username]
)

end
end

describe "GET api/v1/users#index"
do

  context "It returns all the posts"
do
  let (: user) {
    create(: user)
  }
let (: user_id) {
  user.id
}
let (: post) {
  create(: post, user_id: user_id)
}
let (: post_id) {
  post.id
}

before do
  get "/api/v1/users"
end

it_returns_status(200)
end
end

end