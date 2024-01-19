Feature: Testing Users API

  Background:
    * url 'https://reqres.in/api'

  Scenario: Successful API Request
    Given path 'users'
    And param page = 2
    When method get
    Then status 200
    And match response.data[0].id == 7

  Scenario: Failed API Request
    Given path 'users'
    And param page = 2
    When method get
    Then status 400
