require 'rails_helper'

feature "a band member adds a new song", %Q{
As a member of a band
I want to add a new song
So that we can create a new hit song

Acceptance Criteria
[ ] I must be able to add a new song from my bands page
[ ] I must not be able to add a song to another bands page
[ ] I must be presented with errors if the form is filled out incorrectly
[ ] I must provide a Title and a Tempo.
[ ] I optionally can make the song public or private and an image
} do

  scenario "a band member adds a new song successfully" do
    user = FactoryGirl.create(:user)
    band = FactoryGirl.create(:band)
    song = FactoryGirl.create(:song)
    sign_in_as(user)

    click_link band.name

    click_link "Add New Song"

    expect(page).to have_content "Fill out the form below to add a new song"
    fill_in "Title", with: song.title
    fill_in "Tempo", with: song.tempo
    click_button "Submit Song"

    expect(page).to have_content song.title
    expect(page).to have_content song.tempo
  end

  scenario "a band member adds a song with bad validations", focus: true do
    user = FactoryGirl.create(:user)
    band = FactoryGirl.create(:band)
    song = FactoryGirl.create(:song)
    sign_in_as(user)

    click_link band.title
    click_link "Add New Song"

    expect(page).to_have content "Fill out the form below to add a new song"
    fill_in "Tempo", with: song.title
    click_button "Submit Song"

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Tempo must be numberical"

    fill_in "Title", with: song.title
    fill_in "Tempo", with: "1000"
    click_button "Submit Song"
    expect(page).to have_content "Tempo cannot exceed 500"
  end
end
