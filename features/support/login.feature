Feature: Login
As a user
I want to login to the website
So that I can see my account

Scenario: invalid login
Given I am on the login page
When enter wrong details for Login
Then error shown

Scenario: valid login 
Given I am on the login page
When enter details for Login
Then go to home page