Feature: Login
As a user
I want to login to the website
So that I can see my account

<<<<<<< HEAD
=======
Scenario: invalid login
Given I am on the login page
When enter wrong details for Login
Then error shown

>>>>>>> 671d6753e65167fb055c38ecbb89eb8dd59405a4
Scenario: valid login 
Given I am on the login page
When enter details for Login
Then go to home page