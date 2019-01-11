require "rails_helper"
require "selenium-webdriver"

RSpec.describe "user login logout", :type => :system do
  before do
    driven_by(:selenium_chrome_headless) #switch :selenium_chrome_headless to :selenium_chrome to enjoy the gui tests
  end

  it "logs in a valid existing user" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    visit "/login"

    fill_in "session_email", :with => "joe@myumanitoba.ca"
    fill_in "session_password", :with => "12345678"
    click_button "Log in"

    expect(page).to have_text("Account")
  end


  it "logs in an invalid user (invalid email)" do
    visit "/login"

    fill_in "session_email", :with => "jo@myumanitoba.ca"
    fill_in "session_password", :with => "12345678"
    click_button "Log in"

    expect(page).to have_text("Invalid email/password combination")
  end

  it "logs in an invalid user (valid username, incorrect password)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    visit "/login"

    fill_in "session_email", :with => "joe@myumanitoba.ca"
    fill_in "session_password", :with => "1234567"
    click_button "Log in"

    expect(page).to have_text("Invalid email/password combination")
  end

  it "logs in a valid user then logs out" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    visit "/login"

    fill_in "session_email", :with => "joe@myumanitoba.ca"
    fill_in "session_password", :with => "12345678"
    click_button "Log in"

    expect(page).to have_text("Account")

    click_link "Account"
    click_link "Log out"

    expect(page).to have_text("Log in")
   end
end
