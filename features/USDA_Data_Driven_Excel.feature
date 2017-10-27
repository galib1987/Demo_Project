Feature: As a user I should be able to get personalize answer by using the discovery search tool

  Scenario Outline: Discovery tool shows results based on different choices through the discovery path
    Given user visit USDA site
    When user clicks on get started on discovery tool
    And User choose option "<Firm Location>" from the list select
    And User choose option1 "<who_are_you?>" from the list select
    And User choose option2 "<what_are_you_farming?>" from the list select
    And User choose option3 "<what_is_your_model?>" from the list select
    And User choose option4 "<what_do_you_need?>" from the list select
    And User click on Apply button to search information
    Then user gets results based on the choices made
    Examples:
      | Firm Location |  | who_are_you? |  | what_are_you_farming? |  | what_is_your_model? |  | what_do_you_need? |
      | 1             |  | 1            |  | 1                     |  | 1                   |  | 1                 |
      | 2             |  | 2            |  | 2                     |  | 2                   |  | 2                 |
      | 3             |  | 3            |  | 3                     |  | 3                   |  | 3                 |
