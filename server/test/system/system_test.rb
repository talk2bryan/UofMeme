require "application_system_test_case"
 
class SystemTest < ApplicationSystemTestCase
	test "Users can create an account with myumanitoba email" do
		# go to home page, make sure that it has loaded
		visit "#index"
		page.has_title? "UofMeme"

		# click on button to create an account
		find 'a', :text => "Sign up now!"
		click_on "Sign up now!"

		find 'h2', :text => "Sign up"
		fill_in 'user_username', :with => "john"
		fill_in 'user_email', :with => "john@myumanitoba.ca"
		fill_in 'user_password', :with => "password"
		fill_in 'user_password_confirmation', :with => "password"
		click_button "Sign up"

		# after making an account, try to sign in
		find 'a', :text => "Log in"
		click_on "Log in"

		find 'h1', :text => "Log in"
		fill_in 'session_email', :with => "john@myumanitoba.ca"
		fill_in 'session_password', :with => "password"
		click_button "Log in"
	end
	
	test "Users can upload their own memes" do
		# taken from: https://stackoverflow.com/questions/45121846/how-could-i-test-that-chose-file-dialog-opensrails-capybara
		# The file selection box is a system modal, which basically freezes everything until a file is selected. 
		# Because of this (and for security reasons) drivers handle attaching files to file inputs differently than 
		# most fields. It isn't done by sending keystrokes to fields on the page, but rather by shortcutting the 
		# file modal from appearing and adding the file behind the scenes. Because of that you really can't write a 
		# test that detects the presence of the choose file window.	
	end
end