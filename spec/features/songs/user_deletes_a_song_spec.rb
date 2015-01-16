require "rails_helper"

feature "a band member deletes a song", %q(
As a band member
I want to delete one of my own songs
So that no one can hear that horrible song

Acceptance Criteria
[X] I must be able to delete a song from the individual song page
[ ] I must not be able to delete someone else's song
) do

  before :each do
    @user = FactoryGirl.create(:user)
    @band = FactoryGirl.create(:band)
    @song = FactoryGirl.create(:song, band_id: @band.id)
    @song2 = FactoryGirl.create(:song, band_id: @band.id)
  end

    scenario "band member deletes a song" do

    visit band_path(@band)
    click_link @song.title
    click_link "Delete Song"

    expect(page).to_not have_content @song.title
    expect(page).to have_content @song2.title
  end
end
