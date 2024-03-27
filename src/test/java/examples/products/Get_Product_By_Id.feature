Feature: Testing GET Products API

  Scenario: Verify response from GET specific product endpoint
    Given url 'https://dummyjson.com/products/1'
    When method GET
    Then status 200
      # assertions pour que le status soit 200
    And assert responseStatus == 200
      # assertions sur le titre
    And match response.title == 'iPhone 9'
      # assertions sur le price
    And match response.price == 549