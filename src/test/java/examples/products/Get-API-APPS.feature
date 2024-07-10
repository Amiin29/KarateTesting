Feature: Testing Users API

  Background:
    * url 'https://reqres.in/api'

  Scenario: Successful API Request
    Given path 'users'
    And param page = 2
    When method get
    Then status 200
    And match response.data[0].id == 7
    And match response.page == 2

  Scenario: API Request with Invalid Page Number
    Given path 'users'
    And param page = -1
    When method get
    Then status 400
  Scenario: API Request with Non-Existent Page
    Given path 'users'
    And param page = 9999
    When method get
    Then status 200
    And match response.data == []

  Scenario: API Request without Page Parameter
    Given path 'users'
    When method get
    Then status 200
    And match response.page == 1
    And match response.data.size() > 0

  Scenario: API Request with Valid User ID
    Given path 'users/7'
    When method get
    Then status 200
    And match response.data.id == 7

  Scenario: API Request with Invalid User ID
    Given path 'users/9999'
    When method get
    Then status 404

  Scenario: API Request with Missing User ID
    Given path 'users/'
    When method get
    Then status 404

  Scenario: API Request with Additional Parameters
    Given path 'users'
    And param page = 2
    And param per_page = 3
    When method get
    Then status 200
    And match response.page == 2
    And match response.per_page == 3

  Scenario: API Request with Invalid Parameters
    Given path 'users'
    And param invalid_param = 'invalid'
    When method get
    Then status 400

  Scenario: API Request with Filtered Data
    Given path 'users'
    And param page = 1
    And param per_page = 1
    When method get
    Then status 200
    And match response.data.size() == 1

  Scenario: Check Headers
    Given path 'users'
    And param page = 2
    When method get
    Then status 200
    And match responseHeaders['Content-Type'] contains 'application/json'

  Scenario: Check Response Time
    Given path 'users'
    And param page = 2
    When method get
    Then status 200
    And match responseTime < 2000
