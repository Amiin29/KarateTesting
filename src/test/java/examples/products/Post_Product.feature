Feature: Testing POST Products API

  Background:
    * def baseUrl = 'https://dummyjson.com'
    * def productPayload = { id: 35, title: 'Test product', description: 'Description of the new product', price: 100, discountPercentage: 0, rating: 0, stock: 100, brand: 'Brand', category: 'Category', thumbnail: 'https://dummyurl.com/thumbnail.jpg', images: ['https://dummyurl.com/image1.jpg', 'https://dummyurl.com/image2.jpg'] }

  Scenario: Add a new product
    Given url baseUrl + '/products/add'
    And request productPayload
    When method POST
    Then status 200
    And assert responseStatus == 200

  Scenario: Verify added product
    Given url baseUrl + '/products/35'
    When method GET
    Then status 200
    And assert responseStatus == 200
    And match response.id == 35
