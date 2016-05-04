Feature: Track Checkin and Checkout
  As a boss/leader
  So I can see who has checked out a suit or is late to return a suit
  I want to not lose a suit in the system
  
 Background: suits in database
    Given following suits are rented:
      | Rent  |   UIN   |Apparel_ID|Checkout_Date|Expected_Return_Date|   Return_Date   |
      |   1   |112001896|    MJ1   |   1/18/16   |      1/27/16       |    1/28/16      |
      |   2   |112001896|    MJ2   |   1/18/16   |      1/27/16       |    1/27/16      |
      |   3   |112001896|    MJ3   |   1/18/16   |      1/27/16       |    1/26/16      |
      |   4   |112001896|    MJ4   |   1/18/16   |      1/27/16       |    1/26/16      |
      
      
Scenario: Check what suit is checked out
   Given I am on the home page
   When  I follow the "Checked Out" link
   Then  I expect to be on the Checked Out page
   And   I expect to see suit "MJ1" on the list of checked out suits
   
Scenario: Check what suit is late
   Given I am on the home page
   When  I follow the "Late" link
   Then  I expect to be on the Late page
   And   I expect to see suit "MJ1" on the list of late suits
   But   I expect not to see suits "MJ2", "MJ3" , and "MJ4" checked out
   