require 'rails_helper'

feature "user edits a band", %q(
As a registered user
I want to edit one of my bands
So that I can add, remove, or modify its settings

Acceptance Criteria
[X] I must be able to edit the band from the unique band page
[X] I must be able to update the name, bio, and genre of the band
[X] I must be presented with errors if the form is filled out incorrectly
[ ] I must not be able to edit someone else's band.
) do

    before :each do
      @user = FactoryGirl.create(:user)
      @band1 = FactoryGirl.create(:band)
      @band2 = FactoryGirl.create(:band)
    end

    scenario "user successfully edits a band" do
      sign_in_as(@user)

      click_link @band1.name
      expect(page).to have_content @band1.name
      click_link "Edit Band"

      fill_in "Name", with: "#{@band1.name}12345"
      fill_in "Bio", with: "#{@band1.bio}12345"
      fill_in "Genre", with: "#{@band1.genre}12345"
      click_button "Update Band"

      expect(page).to have_content "#{@band1.name}12345"
      expect(page).to have_content "#{@band1.bio}12345"
      expect(page).to have_content "#{@band1.genre}12345"
    end

    scenario "user fills out bio field incorrectly" do

      sign_in_as(@user)
      visit edit_band_path(@band1)
      fill_in "Bio", with: "x"*301
      click_button "Update Band"

      expect(page).to have_content "Bio is too long (maximum is 300 characters)"
      expect(page).to_not have_content "Your band has been successfully updated."

    end

    scenario "user unsuccessfully tries to edit another user's band" do
      band1 = FactoryGirl.create(:band)
      band2 = FactoryGirl.create(:band)

      sign_in_as(band1.user)

      visit playlist_path(band2)

      expect(page).to_not have_content "Edit Playlist"
    end
  end
