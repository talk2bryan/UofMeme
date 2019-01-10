require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  user= User.new(username: "joe", email: "joe@myumanitoba.ca", password: "123456
    78", password_confirmation: "12345678")

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end


    describe "Login" do
      it "should succeed with valid credentials" do
        post :create, params: {session: {email: "joe@myumanitoba.ca", password: "
          12345678"} }
          expect(response).to render_template("layouts/application")
          expect(response).to be_successful
          expect(response).to have_http_status(200)
        end

        it "should fail with invalid credentials" do
          post :create, params: {session: {email: "joe@myumanitoba.ca", password: "
            1234567"} }
            expect(response).to render_template("sessions/new")
            expect(response).to be_successful
            expect(response).to have_http_status(200)
          end
        end

      end
