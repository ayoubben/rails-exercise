Feature: Tasks feature
  In order to organize my life
  As a guest
  I want to be able to create tasks
  And to mark them as done or pending
  So that I will never forget something

  Scenario: Without tasks
    When I go to the tasks page
    Then I should not see any tasks

  Scenario: With tasks
    Given some tasks have been created
    When I go to the tasks page
    Then I should see some tasks
