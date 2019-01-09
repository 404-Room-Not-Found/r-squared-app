Given(/^I am on the login page$/) do
    visit root_path
end

When(/^I click the login button$/) do 
    click_on "Login"
end

And(/^I provide the correct credentials$/) do
    pending
end

Then(/^I should see the Home page$/) do
    pending
end
    
    