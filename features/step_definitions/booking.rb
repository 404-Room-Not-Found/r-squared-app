require 'user'


Given("I am on the home page") do
 visit ('/home')
end

Then("I shoud see a list of My Reservations") do
  page.has_content?("My Reservations")
end

When("I click Make New Booking") do
    visit ('/new')
end

Then("I shoud see Booker") do
  page.has_content?('Booker')
end

Then("I click Make Booking") do
  visit ('/home')
end


When("I click Edit") do
    visit ('/edit')
end

When("I click Delete") do
  visit ('/home')
end

