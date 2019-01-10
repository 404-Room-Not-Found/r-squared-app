Feature: Booking room
As a user
I want to book rooms
So that I can reserve a room

Scenario: User views booking 
  Given I am on the home page
  Then I shoud see My Reservations
  
Scenario: User make new booking 
  Given I am on the home page
  When I click Make New Booking
  Then I shoud go to new booking page
  And I shoud see Booker 
  And I click Make Booking 
  Then I should go to home page 
  
Scenario: User edit booking 
  Given I am on the home page
  When I click Edit
  Then I shoud go to booking edit page 
  
Scenario: User delete booking 
  Given I am on the home page
  When I click Delete 
  Then I shoud go Home page
