Feature: API testing using Karate Framework

  Background: 
    * url 'https://reqres.in'

  Scenario: Verify whether the all data getting Retrived
    Given path '/api/users?page=2'
    When method GET
    Then status 200
    * print response

  Scenario: Verify whether the id successfully getting Created
    Given path '/api/users'
    And request
      """
      {
      "name": "Barphee",
      "job": "lader"
      }
      """
    When method POST
    Then status 201
    And match $.name =='Barphee'
    And print response
    * def id = response.id
    * print id

  Scenario: Verify whether the id successfully getting Retrieve
    Given path '/api/users/<id>'
    When method GET
    Then status 200

  Scenario: Verify whether the id successfully getting Updated
    Given path '/api/users/<id>'
    And request
      """
      {
      "name": "morpheus",
      "job": "zion resident"
      }
      """
    When method PATCH
    Then status 200
    And print response
    And match response.name == "morpheus"

  Scenario: Verify whether the id successfully getting Updated
    Given path '/api/users/<id>'
    And request
      """
      {
      "name": "Mangoo",
      "job": "Tree"
      }
      """
    When method PUT
    Then status 200
    And print response
    And match response.name != "morpheus"
    And match response.job != "zion resident"

  Scenario: Verify whether the id successfully getting deleted
    Given path '/api/users/<id>'
    When method DELETE
    Then status 204
    And response =="#null"
