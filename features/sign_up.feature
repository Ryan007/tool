# encoding: utf-8

Scenario: Password doesn't match confirmation
  Given I am on the signup page
  When I fill in "you" with "manisiva19@gmail.com"
  And I fill in "Password" with "Secret"
  And I fill in "Password confirmation" with "Password"
  And I press "Sign Up"
  Then the Sign up form should be shown again
  And I should see "Password doesn't match confirmation"
  And I should not be registered