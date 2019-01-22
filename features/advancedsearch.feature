Feature: Advanced Search
As a user
I want to have a search function with filters
So that I can narrow down my search

Scenario: User views Advanced Search form
  Given I am on the Advanced Search page
  Then I should see the Advanced Search form

Scenario: User submits Advanced Search form
  Given I submit the form
  Then I should see a list of available rooms
