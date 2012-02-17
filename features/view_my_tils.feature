Feature: View My TILs
  In order to remember what I have learned
  As a forgetful user
  I want to see my past TILs

  Scenario: View my past TILs
    Given "Aidy" has the following TILs:
      | til                                                               |
      | that someone in BBC has got a task board that is a size of a wall |
      | javascript has got a prototypical inheritance                     |
    And "Vos" has the following TILs:
      | til                       |
      | that tomorrow is Saturday |
    When I log in as Aidy
    Then I should see Aidy's TILs
    And I should not see Vos's TILs
