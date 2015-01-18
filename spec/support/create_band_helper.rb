def create_band(band)
  visit new_band_path
  fill_in "Name", with: band.name
  fill_in "Bio", with: band.bio
  fill_in "Genre", with: band.genre
  click_on "Submit Band"
end
