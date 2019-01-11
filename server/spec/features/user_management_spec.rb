require "rails_helper"

RSpec.feature "users", :type => :feature do
  
  describe "create" do
    it "successfully creates an account" do
      visit root_path

      click_link "Sign up now!"
      expect(page).to have_button('Sign up')

      fill_in "user_username", :with => "john666"
      fill_in "user_email", :with => "john666@umanitoba.ca"
      fill_in "user_password", :with => "password"
      fill_in "user_password_confirmation", :with => "password"
      click_button "Sign up"

      #expect(page).to have_selector('#text', text: "Account created! login to start posting and viewing memes")
      #expect(page).to have_css "a", {text: "UofMeme Home Help Log in"}
      expect(page).to have_text("UofMeme Home Help Log in")
      #expect(page).to have_css('.alert')
      #expect(page).to have_content("Account created!")

      click_link "Log in"
      expect(page).to have_button("Log in")

      fill_in "session_email", :with => "john666@umanitoba.ca"
      fill_in "session_password", :with => "password"
      #find(:css, "#session_remember_me[value=1]").set(true)
      click_button "Log in"
      #expect(current_path).to eq(root_path)

      #visit root_path
      expect(page).to have_text("UofMeme is an application that allows students and employees of the University of Manitoba to create and share memes with each other")
    end
  end

  describe "" do
    it "logs into an account" do
      @user =  User.create(username: "john33", email: "john33@umanitoba.ca", password: "password", password_confirmation: "password")
      @user.save!
      sign_in_as @user
      visit root_path

      # click_link "Log in"
      # expect(page).to have_button("Log in")

      # fill_in "session_email", :with => "john33@umanitoba.ca"
      # fill_in "session_password", :with => "password"
      # click_button "Log in"
      #expect(page).to have_text("Account")
      # expect(page).to have_css "div.ul", {text: "Account"}
      expect(page).to have_text("Account")
      #expect(page).to have_css("div#post_grid") #, { text: "Account"}
      #expect(page).to have_css('ul', class: 'dropdown-menu')
      #expect(page).to redirect_to(root_path)
    end
  end
end
=begin

  scenario "User creates an account" do
    visit "/users/new"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_text("UofMeme Home Help Log in Sign up Username Email Password Confirm password Back UofMeme 2018 Back to top Report a bug")
  end

=end
