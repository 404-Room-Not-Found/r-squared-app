When(/^I click on the Submit button$/) do
  visit results_path
end

Then(/^I should see a list of available rooms$/) do
  expect(page).to have_content("Available rooms")
end
