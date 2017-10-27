Feature: As a user I should be able to get personalize answer by using the discovery search tool

  Scenario Outline: Discovery tool shows results based on different choices through the discovery path
    Given user visit USDA site
    When user clicks on get started on discovery tool
    And User choose option <where_do_you_want_to_farm> from dropdown list
    And User choose option1 <who_are_you> from dropdown list
    And User choose option2 <what_are_you_farming> from dropdown list
    And User choose option3 <what_is_your_model> from dropdown list
    And User choose option4 <what_do_you_need>from dropdown list
    And User click on Apply button to search information
    Then user gets results based on the choices made
    Examples:
      | where_do_you_want_to_farm |  | who_are_you      |  | what_are_you_farming |  | what_is_your_model |  | what_do_you_need  |
      | Arizona                   |  | African American |  | Dairy                |  | Energy             |  | Business Planning |
      | Georgia                   |  | Hispanic         |  | Eggs                 |  | Direct to Consumer |  | Connect           |
      | Arizona                   |  | Disable          |  | Forestry             |  | Value Added        |  | Healthcare        |
