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

  scenario "user adds multiple tracks to a playlist" do
      sign_in_as(@user)

      visit_band_song_path(@band, @song)
      

  end
end
