require "rails_helper"
require "selenium-webdriver"

RSpec.describe "user creation", :type => :system do
  before do
    driven_by(:selenium_chrome_headless) #switch :selenium_chrome_headless to :selenium_chrome to enjoy the gui tests
  end

  it "creates a valid new account" do
    visit root_path

    click_link "Sign up now!"
    expect(current_path).to eq("/users/new")

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Account created! login to start posting and viewing memes")
  end

  it "creates a new valid acount from log in page link" do
    visit "/users"

    click_link "Sign up now"
    expect(current_path).to eq("/users/new")

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Account created! login to start posting and viewing memes")
  end

  it "creates an invalid new account (username already exists)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Account created! login to start posting and viewing memes")

    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe2@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Username has already been taken")
  end

  it "creates an invalid new account (username is blank)" do
    visit "/users/new"

    fill_in "user_username", :with => ""
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Username can't be blank")
  end

  it "creates an invalid new account (username too short)" do
    visit "/users/new"

    fill_in "user_username", :with => "jo"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Username is too short (minimum is 3 characters)")
  end

  it "creates an invalid new account (username too long)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe11joe11joe11joe11joe11joe11j"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Username is too long (maximum is 30 characters)")
  end

  it "creates an invalid new account (email already exists)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Account created! login to start posting and viewing memes")

    visit "/users/new"

    fill_in "user_username", :with => "joe2"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Email has already been taken")
  end

  it "creates an invalid new account (email is blank)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => ""
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Email can't be blank")
  end

  it "creates an invalid new account (email is not valid)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitob.c"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Email : Enter a valid uofm email address")
  end

  it "creates an invalid new account (email too long)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11joe11@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Email is too long (maximum is 255 characters)")
  end

  it "creates an invalid new account (password is blank)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => ""
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("Password can't be blank")
  end

  it "creates an invalid new account (password too short)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "1"
    fill_in "user_password_confirmation", :with => "1"
    click_button "Sign up"

    expect(page).to have_text("Password is too short (minimum is 8 characters)")
  end

  it "creates an invalid new account (password confirmation is blank)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => ""
    click_button "Sign up"

    expect(page).to have_text("Password confirmation can't be blank")
  end

  it "creates an invalid new account (password confirmation too short)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "1234567"
    click_button "Sign up"

    expect(page).to have_text("Password confirmation is too short (minimum is 8 characters)")
  end

  it "creates an invalid new account (password does not match password confirmation)" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "123456789"
    fill_in "user_password_confirmation", :with => "123456781"
    click_button "Sign up"

    expect(page).to have_text("Password confirmation doesn't match Password")
  end
end
