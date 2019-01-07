When(/^I visit the website$/) do
  visit login_path
end

Then(/^I should see the Login view$/) do
  expect(page).to have_content("Login")
end

When(/^I click on the Home button$/) do
  visit home_path
end

Then(/^I should see the Home view$/) do
  expect(page).to have_content("MY RESERVATION")
end

When(/^I click on the Advanced Search button$/) do
  visit advancedsearch_path
end

Then(/^I should see the Advanced Search view$/) do
  expect(page).to have_content("Advanced Search")
end

When(/^I click on the Browsing Search button$/) do
  visit browsingsearch_path
end

Then(/^I should see the Browsing Search view$/) do
  expect(page).to have_content("Browsing Search")
end

