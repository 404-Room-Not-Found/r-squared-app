Feature: Booking room
As a user
I want to book rooms
So that I can reserve a room

Scenario: User views booking 
  Given I am on the home page
  Then I shoud see a list of My Reservations
  
Scenario: User make new booking 
  Given I am on the home page
  When I click Make New Booking
  And I shoud see Booker 
  And I click Make Booking 
  
Scenario: User edit booking 
  Given I am on the home page
  When I click Edit
  Then I shoud see Booker 
  
Scenario: User delete booking 
  Given I am on the home page
  When I click Delete 
  Then I shoud see a list of My Reservations
