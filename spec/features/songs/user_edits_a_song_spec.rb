require 'rails_helper'

feature "Band member edits a song", %Q(
As a band member
I want to be able to edit a song
So that I can update it to fit the song.

Acceptance Criteria
[ ] I must be able to edit the song from the unique song page
[ ] I must be able to update the title and tempo of the song
[ ] I must be presented with errors if the form is filled out incorrectly
[ ] I must not be able to edit someone else's band.
) do

  before :each do
    @user = FactoryGirl.create(:user)
    @band = FactoryGirl.create(:band)
    @song = FactoryGirl.create(:song, band_id: @band.id)
  end

  scenario "user successfully edits a song" do
    sign_in_as(@user)
    visit edit_band_song_path(@band, @song)

    fill_in "Title", with: "#{@song.title}12345"
    fill_in "Tempo", with: "123"
    click_button "Update Song"

    expect(page).to have_content "#{@song.title}12345"
    expect(page).to have_content "123"
  end
end
