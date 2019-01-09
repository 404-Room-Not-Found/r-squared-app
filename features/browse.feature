Feature: Browse searching
As a user
I want to browse building rooms
So that I can view rooms in selected building

Scenario: User views HRBB 
  Given I am on the browse page
  When I click on HRBB
  Then I shoud see HRBB

Scenario: User views RDMC 
  Given I am on the browse page
  When I click on RDMC
  Then I shoud see RDMC
  
Scenario: User views all room 
  Given I am on the browse page
  When I click on All Rooms
  Then I shoud see All Rooms