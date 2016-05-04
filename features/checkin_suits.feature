Feature: Check in a Suit

 As an employee
 So that I can have more time with the customers
 I would want to easily check in a suit so I not waste time

Background: On home page

Scenario: Check in a returned suit
  Given A user is logged in as "cfajitas"
  Given I am on the home page
  When  I follow "Check In"
  Then  I am on the checkin page
  When  I fill in the "uin" with "123456789"
  And   I fill in the "apparel_id" with "12"
  And   I fill in the "return_date" with "04/12/2016"
  And   I follow "Submit"