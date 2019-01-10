Given("I am on the browse page") do
  visit ('/browsingsearch')
end

When("I click on HRBB") do
  #visit the hrbb page
end

Then("I shoud see HRBB") do
  expect(page).to have_content("HRBB")
end

When("I click on RDMC") do
  #visit RDMC page
end

Then("I shoud see RDMC") do
  expect(page).to have_content("RDMC")
end

When("I click on All Rooms") do
  expect(page).to have_content("All Rooms")
end

Then("I shoud see All Rooms") do
  visit ('/rooms')
end
