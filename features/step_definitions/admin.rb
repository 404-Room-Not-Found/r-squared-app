require 'user'

Given("I am on home page") do
   visit ('/home')
end

When("I click on Add Room") do
  visit ('/add')
end

Then("I should see Add") do
  page.has_content?("Add Room")
end

When("I click on Delete Room") do
  visit ('/delete')
end

Then("I should see Delete") do
  page.has_content?("Delete Room")
end