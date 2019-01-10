require 'user'

Given ("a valid user") do
  @user = User.create!({:name => "pcr",
             :email => "pcr@gmail.com",
             :password => "1234",
             :password_confirmation => "1234"
           })
end

Given ("a logged in user") do
    visit ('/login')
    fill_in "Email", :with => "pcr@gmail.com"
    fill_in "Password", :with => "1234"
    click_button "Log in"
end

Then("I should go to home path") do
  visit ('/home')
end


Given ("an invalid user") do
  @user = User.create!({:name => "no",
             :email => "no@gmail.com",
             :password => "no",
             :password_confirmation => "no"
           })
end

Given ("a nonuser") do
    visit ('/login')
    fill_in "Email", :with => "no@gmail.com"
    fill_in "Password", :with => " "
    click_button "Log in"
end

Then("I should go to login path") do
  visit ('/login')
end


Given("I am on the login page") do
 visit ('/login')
end

Given("the url is incorrect") do
  has_link?("Home", href: "/home")
end

Then("I should be redirected to the log in screen") do
  visit ('/login')
end

Then("I should go to that page") do
  visit ('/home')
end