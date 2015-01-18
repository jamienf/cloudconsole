require "rails_helper"

feature "a user deletes a band", %q(
As a user
I want to delete one of my own bands
So that no one can see my band

Acceptance Criteria
[X] I must be able to delete my band from the individual band page
[ ] I must not be able to delete someone else's band
) do

  before :each do
    @user = FactoryGirl.create(:user)
    @band1 = FactoryGirl.create(:band)
  end

  scenario "a user deletes a band successfully" do
    sign_in_as(@user)
    create_band(@band1)

    click_link "Delete Band"
    expect(page).to have_content "Your band has been successfully deleted."
    expect(page).to_not have_content @band1.name
  end
end
