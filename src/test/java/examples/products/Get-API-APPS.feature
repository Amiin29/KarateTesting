Feature: Testing GET Products API

  Scenario: Verify response from GET products endpoint
    Given url 'https://dummyjson.com/products'
    When method GET
    Then status 200
    And assert responseStatus == 200
