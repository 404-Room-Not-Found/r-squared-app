require 'user'

Given("I am on the Advanced Search page") do
  visit advancedsearch_path
end

Then("I should see the Advanced Search form") do
  expect(page).to have_content("Advanced Search")
  expect(page).to have_content("Room Preferences")
  expect(page).to have_content("Location")
  expect(page).to have_content("Room Type")
  expect(page).to have_content("Facilities")
  expect(page).to have_content("Reservation Period")
  expect(page).to have_content("Start Date")
  expect(page).to have_content("End Date")
  expect(page).to have_content("Start Time")
  expect(page).to have_content("End Time")
  expect(page).to have_content("Search")
end

When("I submit the form") do
  visit ('/rooms')
end

Then("I should see a list of available rooms") do
  expect(page).to have_content("Rooms")
end

