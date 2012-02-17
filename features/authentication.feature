Feature: Authentication
  In order to see TILs authors
  As a user
  I want to be able to authenticate 

  Scenario: successful login
    Given there is a user with name "renzo" and password "mypwd"
    When I login as "renzo" with password "mypwd"
    Then I should be logged in as "renzo"
