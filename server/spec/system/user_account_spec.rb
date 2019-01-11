require "rails_helper"
require "selenium-webdriver"

RSpec.describe "user account", :type => :system do
  before do
    driven_by(:selenium_chrome_headless) #switch :selenium_chrome_headless to :selenium_chrome to enjoy the gui tests
  end

  it "views account profile" do
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
    click_link "Profile"

    expect(page).to have_text("Username:")
    expect(page).to have_text("Email:")
    expect(page).to have_text("Your posts")
   end

  it "views account settings" do
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
    click_link "Settings"

    expect(current_path).to eq("/")
   end
end
