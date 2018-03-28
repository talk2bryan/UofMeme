require "rails_helper"

RSpec.feature "User management", :type => :feature do

  scenario "User creates an account" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("UofMeme Home Help Log in Sign up Username Email Password Confirm password Back UofMeme 2018 Back to top Report a bug")
  end

end