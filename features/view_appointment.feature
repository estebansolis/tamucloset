Feature: View all appointments

  As a employee
  So that I can keep track of appointments
  I want to view appointments on a calendar

Background: On Home Page
  
Scenario: Look at appointments page
  Given A user is logged in as "cfajitas"
  Given I am on the home page
  When  I follow "Appointments"
  Then  I am on the appointments page
  And   I see the calendar
  
Scenario: Go back to home page
  Given I am on the appointments page
  When  I follow "Home"
  Then  I am on the home page