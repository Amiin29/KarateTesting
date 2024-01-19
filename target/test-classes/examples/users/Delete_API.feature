Feature: Testing DELETE Method

  Background:
    * url 'https://fakestoreapi.com'

  Scenario: Verify Successful DELETE Request
    Given path 'carts', 6
    When method delete
    Then status 200
    And match response == { success: true }

  Scenario: Verify DELETE Request for Non-Existing Resource
    Given path 'carts', 999  # Assuming 999 does not exist
    When method delete
    Then status 404
    And match response == { success: false, message: 'Resource not found' }

  Scenario: Verify DELETE Request with Invalid Authentication
    Given path 'carts', 6
    And header Authorization = 'Bearer invalidToken'
    When method delete
    Then status 401
    And match response == { success: false, message: 'Unauthorized' }
