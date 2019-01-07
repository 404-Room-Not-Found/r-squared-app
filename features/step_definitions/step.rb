require 'app/models/user.rb'

Given("I am on the login page") do
  browser.goto "http://r-squared.herokuapp.com"
end

When("enter wrong details for Login") do
  browser.text_field(:name,"emailid").set(" ")
  browser.text_field(:pswd,"paswrd").set(" ")
  browser.button(:name,"btnLogin").click
end

Then("error shown") do
  puts " Wrong Login".red
end

When("enter details for Login") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("go to home page") do
  pending # Write code here that turns the phrase above into concrete actions
end


############ reservation ############
Given("Im at the homepage") do
 visit home_path
end

Then("I should see the reservation") do
  @user = User.first
    if user.name == "Anthony Voneiff"
     
  return true
    end 
end






