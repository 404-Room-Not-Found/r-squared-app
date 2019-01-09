Feature: Login page
  
Scenario: User submits a valid username and password
When I submit the valid username and password
Then I should be logged in an shown the home screen

Scenario: User submits an invalid username and password
When I submit the invalid username and password
Then I should be be rejected and stay on the login page

Scenario: User tries to bypass the login by using the path in the url
When I type a path into the url while not logged in
Then I should be redirected to the log in screen

Scenario: User tries to redirect using the path in the url while logged in
When I type a path into the url while logged in
Then I should be redirected to the path if authorized