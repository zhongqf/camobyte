Feature: Update a profile

  Background: 
    Given a user exists with email: "testme@testme.com"
    And I am logged in as "testme@testme.com"
    When I go to the account settings page

  Scenario: Update my profile
    When I follow "Profile Information"
    When I fill in the following:
      | First name  | Tester                     |
      | Last name   | Usera                      |
      | Common name | TestUser                   |
      | Biography   | A test user                |
    And I press "Update account"
    Then I should see "User profile updated!"
    When I go to the profile page
    Then I should see "TestUser"
    And I should see "A test user"


