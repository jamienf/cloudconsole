require 'rails_helper'

feature "a registered user views all bands", %q(
As a user
I want to view all bands
So I can hear what other people are creating

Acceptance Criteria
[ ] I must see all bands on index
[ ] I must see a bands name and image
[ ] I must be able to reach an individual bands show page.
[ ] I must be able to click next page
) do

  scenario "views all bands" do
    band1 = FactoryGirl.create(:band)
    band2 = FactoryGirl.create(:band)

    visit root_path

    expect(page).to have_content band1.name
    expect(page).to have_content band2.name
  end
end
