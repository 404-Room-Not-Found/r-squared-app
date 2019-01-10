Given("I am on the home page") do
 visit ('/home')
end

When("I click Make New Booking") do
  visit('/bookings')
end

Then("I shoud see the new booking") do
  expect(page).to have_content(" ")
end
