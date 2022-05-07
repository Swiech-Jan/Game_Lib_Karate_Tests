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

    Scenario Outline: get user by id - testing /user/id endpoint

        * url baseUrl
        * path 'user/' + '<id>'
        * method get
        * status 200
        * def user = response
        * match user == <expectedResponse>

        Examples:
            | id | expectedResponse                                       |
            | 1  | { id: 1, username: "Test", age: 22, name: "John" }     |
            | 2  | { id: 2, username: "Test2", age: 18, name: "Angela" }  |
            | 3  | { id: 3, username: "Test3", age: 25, name: "Hero" }    |
            | 4  | { id: 4, username: "Test4", age: 30, name: "Abraham" } |
            | 5  | { id: 5, username: "Test5", age: 32, name: "Tomek" }   |
            | 0  | " Nie ma użytkowika o takim ID. I am sorry! "          |
