require "rails_helper"

RSpec.describe "User management", :type => :system do
  before do
    driven_by(:selenium_chrome) #switch :selenium_chrome_headless to :selenium_chrome to enjoy the gui tests
  end
   path =  "#{Rails.root}/app/assets/images/uofmeme_logo.png"

  it "Allows a signed in user to upload a meme" do

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


	click_link "Upload Meme Now"

	#attach_file I18n.t("post_image"), path

	attach_file('post_image', path)

	#find(:xpath, "post_poster").set "joe"
	#find(:xpath, "post_user_id").set "1"

	#fill_in "post_poster", :with => 'joe', visible: false
	#fill_in "post_user_id", :with => '1'

	#find("#poster", :visible => false).set "joe"
	#find("#user_id", :visible => false).set "1"

	find(:css, '#poster').set("joe") 
	find(:css, '#user_id').set("1") 
	
	#fill_in "post_image", :with =>
	fill_in "post_description", :with => "just a post"
	fill_in "post_top_txt", :with => "just a post"
	fill_in "post_bot_txt", :with => "just a post"

	expect(page).to have_text("UofMeme is an application that allows students and employees of the University of Manitoba to create and share memes with each other")

  end

 end