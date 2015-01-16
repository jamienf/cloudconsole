require 'rails_helper'

feature "a band member views all songs", %Q{
As a member of a band
I want to view all songs
So that I can see the work we have created

Acceptance Criteria
[ ] I must be able to view all songs from the unique band page
[ ] I must not see other band's songs
} do

  before :each do
    @user = FactoryGirl.create(:user)
    @band1 = FactoryGirl.create(:band)
    @song1 = FactoryGirl.create(:song, band_id: @band1.id)
    @band2 = FactoryGirl.create(:band)
    @song2 = FactoryGirl.create(:song, band_id: @band2.id)
  end

  scenario "User views all songs on band page" do
    sign_in_as(@user)
    visit band_path(@band1)

    expect(page).to have_link @song1.title
    expect(page).to_not have_link @song2.title

    visit band_path(@band2)

    expect(page).to have_link @song2.title
    expect(page).to_not have_link @song1.title
  end
end
