Feature: Simple Smoke Tests Of Express Server Endpoints

     # List of Test Cases:

     # Get all users - Scenario 1
     # Get user by id - Scenario 2
     # Get all games - Scenario 3
     # Get game by id - Scenario 4
     # Get all reviews - Scenario 5
     # Get review by id - Scenario 6


    Background:
    # not needed

    Scenario: get all users - testing /users endpoint

        * url baseUrl
        * path 'users'
        * method get
        * status 200
        * match response.users != []
        * match each response.users == { id: '#number', username: '#string', age: '#number', name: '#string' }
        * print 'users response: ', response