require "rails_helper"

feature "User becomes band owner", %q(
As a user
I want to be the band owner when I create it
So that someone can manage our band settings

Acceptance Criteria
[X] I must be added to the band as a member when it is created
[ ] I must be able to edit the band settings
[ ] I must not be able to edit other bands settings
) do

  before :each do
    @user1 = FactoryGirl.create(:user)
    @band1 = FactoryGirl.create(:band)
  end

  scenario "Band creator becomes band owner" do
    sign_in_as(@user1)

    click_button "Create new band"
    expect(page).to have_content "Fill out the form below to create a new band"
    fill_in "Name", with: @band1.name
    fill_in "Bio", with: @band1.bio
    fill_in "Genre", with: @band1.genre
    click_button "Submit Band"

    expect(page).to have_content "#{@user1.email}"
    expect(page).to have_link "Add Band Member"
  end

  scenario "Band owner cannot edit band they do not own" do
    sign_in_as(@user1)

    click_button "Create new band"
    expect(page).to have_content "Fill out the form below to create a new band"
    fill_in "Name", with: "Pirates!"
    fill_in "Bio", with: @band1.bio
    fill_in "Genre", with: @band1.genre
    click_button "Submit Band"

    click_link "Sign Out"

    click_link "Pirates!"
    expect(page).to have_content "#{@user1.email}"
    expect(page).to_not have_link "Add Band Member"
    expect(page).to_not have_link "Add New Song"
    expect(page).to_not have_link "Edit Band"
    expect(page).to_not have_link "Delete Band"
  end
end
