require "rails_helper"

feature "a user deletes a band", %q(
As a user
I want to delete one of my own bands
So that no one can see my band

Acceptance Criteria
[ ] I must be able to delete my band from the individual band page
[ ] I must not be able to delete someone else's band
) do

  scenario "a user deletes a band successfully" do

    band = FactoryGirl.create(:band)

    sign_in_as(band.user)

    click_link band.name

    click_link "Delete band"
    expect(page).to have_content "Your band has been successfully deleted."
    expect(page).to_not have_content band.name
  end

  scenario "a user tries to delete another user's band" do

    band1 = FactoryGirl.create(:band)
    band2 = FactoryGirl.create(:band)

    sign_in_as(band1.user)

    visit band_path(band2)

    expect(page).to_not have_content "Delete band"
  end
end
