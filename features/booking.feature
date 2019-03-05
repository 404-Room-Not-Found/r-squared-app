Feature: Booking room
As a user
I want to book rooms
So that I can reserve a room

Scenario: User views booking 
  Given I am on the home page
  Then I shoud see a list of My Reservations
  
Scenario: User views Calander 
  Given I am on the home page
  When I click Calander View
  Then I shoud see a list of Calander View
  
Scenario: User views List
  Given I am on the home page
  When I click List View
  Then I shoud see a list of My Reservation
  
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
  
Scenario: User views History
  Given I am on the home page
  When I click Show History View
  Then I shoud see a list of My History

