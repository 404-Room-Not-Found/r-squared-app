require 'user'


Given("I am on the browse page") do
  visit ('/browsingsearch')
end

When("I click on HRBB") do
  visit ('/bright')
end

Then("I shoud see HRBB") do
  page.has_content?("Bright")
end

When("I click on RDMC") do
  visit ('/rdmc')
end

Then("I shoud see RDMC") do
  expect(page).to have_content("Reed McDonald")
end

When("I click on All Rooms") do
  page.has_content?("All Rooms")
end

Then("I shoud see All Rooms") do
  visit ('/rooms')
end
