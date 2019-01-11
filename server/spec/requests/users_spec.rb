require 'rails_helper'

RSpec.describe "Users", type: :request do
  @user = User.create(username: "john", email: "john@umanitoba.ca", password: "password", password_confirmation: "password")

  it "logs in with post request directly" do
    post "/login", :params => {:session => {:email => "john@umanitoba.ca", :password => "password"}}

    expect(response).to have_http_status(200)
  end

  it "logs in with invalid post request directly" do
    post "/login", :params => {:session => {:email => "john@umanitoba.ca", :password => "passwor"}}

    expect(response).to have_http_status(200)
  end

end
