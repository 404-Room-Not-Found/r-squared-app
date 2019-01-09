Feature: Login

  As a user
  So I can access my profile
  I want to login with my credentials

Scenario: User Logs In 

  Given I am on Login page
  When I click the Login button
  And I provide the correct credentials
  Then I should see the Home page 
