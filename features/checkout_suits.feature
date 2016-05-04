Feature: Check out a Suit

 As an employee
 So that I can have more time with the customers
 I would want to easily check out a suit so I not waste time

Background: On home page

Scenario: Check out a new suit
  Given A user is logged in as "cfajitas"
  Given I am on the home page
  When  I follow "Check Out"
  Then  I am on the checkout page
  When  I fill in the "rental_Rental_ID" with "10"
  And   I fill in the "rental_UIN" with "123456789"
  And   I fill in the "rental_Apparel_ID" with "12"
  And   I fill in the "rental_Checkout_Date" with "04/12/2016"
  And   I fill in the "rental_Expected_Return_Date" with "04/20/2016"
  And   I fill in the "rental_Return_Date" with "04/16/2016"
  And   I press "Create Rental"