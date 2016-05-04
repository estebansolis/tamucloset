Feature: Add/Delete suit
  As a employee
  So that I can keep inventory up to date
  I want to add new suits and delete removed suits

Background: suits in database
  Given the following suits exist:
  
  | Apparel_ID  | Sex     | Article   | Size  | Status |
  | FJ431       | Female  | Jacket    | 32    | In     |
      
Scenario: Add a new suit
  Given A user is logged in as "cfajitas"
  Given I am on the home page
  When  I follow the Available link
  Then  I am on the available page
  When  I follow New Apparel link
  Then  I am on the new apparel page
  When  I fill in the "apparel_Apparel_ID" with "FJ431"
  And   I fill in the "apparel_Sex" with "Female"
  And   I fill in the "apparel_Article" with "Jacket"
  And   I fill in the "apparel_Size" with "2"
  And   I fill in the "apparel_Status" with "In"
  And   I press "Create Apparel"
  Then  I am on the available page
  And   I expect to see "FJ431"
  
Scenario: Delete a existing suit
  Given I am on the home page
  When  I follow "Apparel"
  Then  I am on the available page
  When  I follow "Destroy"
  And   I confirm popup
  Then  I expect to see "Apparel was successfully destroyed."