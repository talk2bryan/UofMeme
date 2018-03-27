require "rails_helper"
require "selenium-webdriver"

RSpec.describe "User management", :type => :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "A new user can create an account" do
		visit "/users/new"

		fill_in "user_username", :with => "joe"
		fill_in "user_email", :with => "joe@myumanitoba.ca"
		fill_in "user_password", :with => "12345678"
		fill_in "user_password_confirmation", :with => "12345678"
		click_button "Sign up"

		expect(page).to have_text("UofMeme is an application that allows")
  end

  it "Does not signup a user if email or username already exits" do 
	  	visit "/users/new"

	    fill_in "user_username", :with => "joe"
	    fill_in "user_email", :with => "joe@myumanitoba.ca"
	    fill_in "user_password", :with => "12345678"
	    fill_in "user_password_confirmation", :with => "12345678"
	    click_button "Sign up"


	    visit "/users/new"

	    fill_in "user_username", :with => "joe"
	    fill_in "user_email", :with => "joe@myumanitoba.ca"
	    fill_in "user_password", :with => "12345678"
	    fill_in "user_password_confirmation", :with => "12345678"
	    click_button "Sign up"

	    expect(page).to have_text("Username has already been taken")
   end

   it "Logs in an existing user with the right parameters" do
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

	    expect(page).to have_text("UofMeme is an application that allows students and employees of the University of Manitoba to create and share memes with each other")

   end

    it "Logs in an existing user with the right parameters" do
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

	    expect(page).to have_text("UofMeme is an application that allows students and employees of the University of Manitoba to create and share memes with each other")

   end


    it "Doesn't Logs in a user with an invalid parameters" do
	   	visit "/users/new"

	   	fill_in "user_username", :with => "joe"
	    fill_in "user_email", :with => "joe@myumanitoba.ca"
	    fill_in "user_password", :with => "12345678"
	    fill_in "user_password_confirmation", :with => "12345678"
	    click_button "Sign up"

	    visit "/login"

	    fill_in "session_email", :with => "jo@myumanitoba.ca"
	    fill_in "session_password", :with => "12345678"
	    click_button "Log in"
	    expect(page).to have_text("Invalid email/password combination")

   end

    it "If a User is on the main page and has not signed up, they should click on the signup button on the main page and login after via the login button" do
	   	visit "/users"

	    click_link "Sign up now"

	    fill_in "user_username", :with => "joe"
	    fill_in "user_email", :with => "joe@myumanitoba.ca"
	    fill_in "user_password", :with => "12345678"
	    fill_in "user_password_confirmation", :with => "12345678"
	    click_button "Sign up"
	    expect(page).to have_text("UofMeme is an application that allows students and employees of the University of Manitoba to create and share memes with each other")

	    click_link "Log in"

	    fill_in "session_email", :with => "joe@myumanitoba.ca"
	    fill_in "session_password", :with => "12345678"
	    click_button "Log in"

	    expect(page).to have_text("UofMeme is an application that allows students and employees of the University of Manitoba to create and share memes with each other")
   end

   it "A user can log out after signing in via the Accounts button " do
   	   	visit "/users"

	    click_link "Sign up now"

	    fill_in "user_username", :with => "joe"
	    fill_in "user_email", :with => "joe@myumanitoba.ca"
	    fill_in "user_password", :with => "12345678"
	    fill_in "user_password_confirmation", :with => "12345678"
	    click_button "Sign up"
	    expect(page).to have_text("UofMeme is an application that allows students and employees of the University of Manitoba to create and share memes with each other")

   		#click_link "Account"
   		click_link "Log in"

   		#page.find(:xpath, "//a[@href='/users/logout']").click
   		expect(page).to have_text("Email")

   		fill_in "session_email", :with => "joe@myumanitoba.ca"
	    fill_in "session_password", :with => "12345678"
	    click_button "Log in"

	    expect(page).to have_text("UofMeme is an application that allows students and employees of the University of Manitoba to create and share memes with each other")

	    click_link "Account"
	    click_link "Log out"
	    expect(page).to have_text("UofMeme is an application that allows students and employees of the University of Manitoba to create and share memes with each other")
   end

end