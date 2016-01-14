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

  Scenario: Create a new task
    When I go to the tasks page
    And I create a new task
    Then I should see a task

  Scenario: Flag a task as done
    Given some tasks have been created
    When I go to the tasks page
    And I check the first task
    Then the first task should be done

  Scenario: Revert a task as pending
    Given some tasks have been created
    And the first task is done
    When I check the first task
    Then the first task should be pending
