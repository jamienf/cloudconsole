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

    user1 = FactoryGirl.create(:user)
    band1 = FactoryGirl.create(:band, user_id: user1.id)
    user2 = FactoryGirl.create(:user)
    band2 = FactoryGirl.create(:band, user_id: user2.id)

    visit root_path

    expect(page).to have_content band1.name
    expect(page).to have_content band2.name
  end

  scenario "user views another users band" do

    user1 = FactoryGirl.create(:user)
    band1 = FactoryGirl.create(:band, user_id: user1.id)
    user2 = FactoryGirl.create(:user)
    band2 = FactoryGirl.create(:band, user_id: user2.id)

    sign_in_as(user1)
    visit root_path

    click_link band1.name

    expect(page).to have_content band1.name
    expect(page).to have_content band1.bio
    expect(page).to have_content band1.genre
    expect(page).to_not have_content band2.name
  end

  scenario "user views band on next page" do

    20.times do
      FactoryGirl.create(:band)
    end

    visit root_path

    expect(page).to have_link "Next"
  end
end
