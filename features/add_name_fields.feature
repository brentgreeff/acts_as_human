Feature: Add name fields
  To make it easier to deal with user input and display of names
  As a Developer
  I want to run add a migration to add first_name, middle_names
  and last_name fields to the User model

  Scenario: Generate Migration
    When I run `acts_as_human migration visitors`
      Then the output should contain "Migration created"
      And the migration should contain the name fields
