Feature: This test will verify that the system shall display a message if the user clicks on the search button without entering any search term
  Scenario: USDA Search Negative Testing
    Given user visit USDA site
    And user clicks on search without entering any data
    Then user is directed to a page and advised to enter a search term.
