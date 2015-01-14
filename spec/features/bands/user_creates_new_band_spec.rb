require 'rails_helper'

feature 'user creates new band', %Q{
  As a registered user
  I want to create a new band
  So that I can manage my songs and band members

  Acceptance Criteria
  [ ] I must be able to add a new band
  [ ] I must be presented with errors if the form is filled out incorrectly
  [ ] I must provide a Name, Bio, and Genre.
  [ ] I optionally can make the band public or private and an image
  } do

  scenario "user successfully adds a band" do
    user = FactoryGirl.create(:user)
    band = FactoryGirl.create(:band, user_id: user.id)
    sign_in_as(user)

    click_link "Create new band"
    expect(page).to have_content "Fill out the form below to add your Band"
    fill_in "Name", with: band.name
    fill_in "Bio", with: band.bio
    fill_in "Genre", with: band.genre
    click_button "Submit Band"

    expect(page).to have_content "Your band has been successfully added."
    expect(page).to have_content band.title
    expect(page).to have_content band.description
    expect(page).to have_content band.user.email
  end

  scenario "user unsuccessfully adds a band" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    click_link "Create new band"
    expect(page).to have_content "Fill out the form below to add your Band"
    click_button "Submit Band"

    expect(page).to have_content "Name cannot be blank"
    expect(page).to have_content "Bio cannot be blank"
    expect(page).to have_content "Genre cannot be blank"
  end
end
