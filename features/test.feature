Feature: See if we can run a feature in elixir

  Scenario: Test something
    When I navigate to heroku 200
    Then I should see heroku 200

  Scenario: Test something else
    When I navigate to heroku 500
    Then I should see heroku 200

  Scenario: View homepage
    When I view the homepage
    Then I should see the homepage

