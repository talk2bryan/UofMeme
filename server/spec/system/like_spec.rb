require "rails_helper"

RSpec.describe "post creation", :type => :system do
  before do
    driven_by(:selenium_chrome_headless)#switch :selenium_chrome_headless to :selenium_chrome to enjoy the gui tests
  end

  path = "#{Rails.root}/app/assets/images/uofmeme_logo.png"
  desc = "just a post"

  it "likes a successfully uploaded post" do
    visit root_path

    click_link "Sign up now!"

    fill_in "user_username", :with => "joe"
    fill_in "user_email", :with => "joe@myumanitoba.ca"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    click_button "Sign up"
    expect(page).to have_text("Account created! login to start posting and viewing memes")

    click_link "Log in"

    fill_in "session_email", :with => "joe@myumanitoba.ca"
    fill_in "session_password", :with => "12345678"
    click_button "Log in"

    expect(page).to have_text("Account")

    click_link "Upload Meme Now!"

    attach_file('post_image', path)
    fill_in "post_description", :with => desc
    # fill_in "post_top_text", :with => "just a post"
    # fill_in "post_bot_text", :with => "just a post"
    click_button "Post my meme!"

    expect(page).to have_text("Meme successfully created")

    visit "/posts/1/show"

    expect(page).to have_text(desc)

    find("[class='glyphicon glyphicon-thumbs-up glyphicon-align-center']").click

    # capybara will NOT do post requests so this will not change -- test in api/request
    # expect(page).to have_text("Score: 1")
  end
end
