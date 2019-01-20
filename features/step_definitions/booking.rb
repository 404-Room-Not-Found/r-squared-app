require 'user'


Given("I am on the home page") do
 visit ('/home')
end

Then("I shoud see the new booking") do
  expect(page).to have_content("My Reservations")
end
