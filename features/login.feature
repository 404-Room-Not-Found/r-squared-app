Feature: Login page
As a user
I want to login correctly 
So that I can avoid bypasser

Scenario: User submits a valid username and password
Given a valid user 
Given a logged in user
Then I should go to home path

Scenario: User submits an invalid username and password
Given an invalid user 
Given a nonuser
Then I should go to login path

Scenario: User tries to bypass the login by using the path in the url
Given I am on the login page 
And the url is incorrect 
Then I should be redirected to the log in screen

Scenario: User tries to redirect using the path in the url while logged in
Given I am on the home page 
And the url is incorrect 
Then I should go to that page