Feature: Edit TIL
  In order to keep TIL correct
  As a pedantic user
  I want to edit existing content

  Scenario: Edit TIL
    Given there is a TIL
    When I change its content to "hello monkeys"
    Then its content is changed
