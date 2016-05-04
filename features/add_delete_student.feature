Feature: Add/Delete student
  As a employee
  So that I can keep students up to date
  I want to add new students and delete old students

Background: students in database
  Given the following students exist:
  
  | UIN        | First_Name  | Last_Name  | Email              | Phone_Number |
  | 922004958  | Rafael      | Salas      | rafsalas@tamu.edu  | 2478247242   |
      
Scenario: Add a new student
  Given A user is logged in as "cfajitas"
  Given I am on the home page
  When  I follow the Students link
  Then  I am on the students page
  When  I follow "New Student"
  And   I fill in the "student_UIN" with "123456789"
  And   I fill in the "student_First_Name" with "John"
  And   I fill in the "student_Last_Name" with "Smith"
  And   I fill in the "student_Email" with "person@tamu.edu"
  And   I fill in the "student_Phone_Number" with "0987654321"
  And   I press "Create Student"
  Then  I expect to see "Student was successfully created."
  And   I follow "Back"
  Then  I am on the students page
  And   I expect to see "123456789"
  
Scenario: Delete a existing student
  Given I am on the home page
  When  I follow "Students"
  Then  I am on the students page
  When  I follow "Destroy"
  And   I confirm popup
  Then  I expect to see "Student was successfully destroyed."