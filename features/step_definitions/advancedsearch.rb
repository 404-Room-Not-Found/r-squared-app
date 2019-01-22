require 'user'


Given("I am on the Advanced Search page") do
  visit ('/advancedsearch')
end

Then("I should see the Advanced Search form") do
  expect(page).to have_content("Advanced Search")
  expect(page).to have_content("Building")
  expect(page).to have_content("Room Type")
  expect(page).to have_content("Number of People")
  expect(page).to have_content("Furniture")
  expect(page).to have_content("Technology")

end

Given("I submit the form") do
  visit ('/results?')
end

Then("I should see a list of available rooms") do
  page.has_content?("Search Results")
end

