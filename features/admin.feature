Feature: Admin abilities
As a Admin
I want to add and delete rooms
So that I can make changes to the avalible rooms.


Scenario: Admin add rooms
  Given I am on home page 
  When I click on Add Room
  Then I should see Add

Scenario: Admin delete rooms
  Given I am on home page 
  When I click on Delete Room
  Then I should see Delete

