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

When("I click Calander View") do
  visit ('/calander')
end

Then("I shoud see a list of Calander View") do
  page.has_content?('Calander')
end

When("I click List View") do
  visit ('/home')
end

Then("I shoud see a list of My Reservation") do
  page.has_content?("My Reservations")
end

When("I click Show History View") do
  visit ('/home')
end

Then("I shoud see a list of My History") do
  page.has_content?("My History")
end