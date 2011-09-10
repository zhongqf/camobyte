@signup
Feature: Logging In

  Background: 
    Given I am currently "zhongqf@gmail.com"
    And I go to the login page
    And I fill in "Email" with "zhongqf@gmail.com"
    And I fill in "Password" with "papapa"
  
  Scenario: Successful to log in
    When I press "Login"
    Then I am on the home page
    And I should see "Some text"

  Scenario: Fail to log in when deleted
    When I am deleted
    And I press "Login"
    Then I am on the login page
    And I should see "Invalid email or password."

  Scenario: Fail to log in when wrong password
    When I fill in "Password" with "wrongpassword"
    And I press "Login"
    Then I am on the login page
    And I should see "Invalid email or password."