require 'rails_helper'

feature 'band member adds track to a song', %Q{
As band member
I want to add a new track to a song
So that I can make the next big hit

Acceptance Criteria
[ ] I must be able to add multiple tracks to one song
[ ] I must be able to play multiple tracks at the same time
} do

  before :each do
    @user = FactoryGirl.create(:user)
    @band = FactoryGirl.create(:band)
    @song = FactoryGirl.create(:song, band_id: @band.id)
  end

  scenario "user adds multiple tracks to a playlist", focus: true do
      sign_in_as(@user)
      visit band_song_path(@band, @song)
      click_link "Add New Track"

      expect(page).to have_content "Fill out the form below to add a new track"
      fill_in "Instrument", with: "Drums"
      fill_in "Soundcloud", with: '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/86614269&amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false"></iframe>'
      click_button "Submit Track"

      click_link "Add New Track"

      expect(page).to have_content "Fill out the form below to add a new track"
      fill_in "Instrument", with: "Guitar"
      fill_in "Soundcloud", with: '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/114376654&amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false"></iframe>'
      click_button "Submit Track"
      save_and_open_page
      expect(page).to have_content "Drums"
      expect(page).to have_content "Guitar"
  end
end
