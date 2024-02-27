Feature: API testing for POST request
  
  Scenario: Verify whether the booking id successfully getting Created
    Given url 'https://restful-booker.herokuapp.com/booking'
    And request
      """
      {
      "firstname" : "Jam",
      "lastname" : "Brownn",
      "totalprice" : 1132,
      "depositpaid" : true,
      "bookingdates" : {
        "checkin" : "2018-02-02",
        "checkout" : "2019-02-02"
      },
      "additionalneeds" : "Snacks"
      }
      """
    And header Authorization = tokenID  
    When method POST
    Then status 201
    Then match response.firstname=="Jam"
    * def bookingId= response.id
