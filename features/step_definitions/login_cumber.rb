#require '/app/models/user.rb'
#require 'uri'
#require 'cgi'
#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given("I am on the login page") do
  visit login_path
end

When("enter details for Login") do
   fill_in('Email', :with => 'pcr@gmail.com')
   fill_in('Password', :with => '1234')
   click_button('login')
end

Then("go to home page") do
 visit home_path
end








