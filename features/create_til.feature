Feature: Create TIL
  In order to remember useful things
  As a forgetful person
  I want to be able to store things I learned today

  Scenario: Create TIL
    Given I learned that "PIPA and SOPA are bullshit"
    When I save this in a TIL
    Then I should see that "PIPA and SOPA are bullshit"

  Scenario: Multiple TILs
    Given I learned that "PIPA and SOPA are bullshit"
    When I save this in a TIL
    And I learned that "Sinatra is shit"
    And I save this in a TIL
    Then I should see that "PIPA and SOPA are bullshit"
    And I should see that "Sinatra is shit"
