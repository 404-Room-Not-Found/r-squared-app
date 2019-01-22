require 'user'



########### logout #############
When("I click on the Logout button") do
  visit login_path
end

Then("I should see the Login page") do
    visit ('/login')
end


########### home page #############
When(/^I click on the Home button$/) do
  visit home_path
end

Then(/^I should see the Home view$/) do
  expect(page).to have_content(" ")
end

########### advance search #############
When(/^I click on the Advanced Search button$/) do
  visit advancedsearch_path
end

Then(/^I should see the Advanced Search view$/) do
  expect(page).to have_content("Advanced Search")
end

########### browsing #############
When(/^I click on the Browsing Search button$/) do
  visit browsingsearch_path
end

Then(/^I should see the Browsing Search view$/) do
  page.has_content?("Browsing Search")
end

