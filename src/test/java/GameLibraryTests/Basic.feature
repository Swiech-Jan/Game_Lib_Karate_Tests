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
        * match each response.users == { id: '#number', nickname: '#string', name: '#string', last name: '#string', age: '#number' }
        * print 'users response: ', response

    Scenario Outline: get user by id - testing /user/id endpoint

        * url baseUrl
        * path 'user/' + '<id>'
        * method get
        * status 200
        * def user = response
        * match user == <expectedResponse>

        Examples:
            | id | expectedResponse                                                             |
            | 1  | { id: 1, nickname: "Hellscream", name: "John", last name: "Black", age: 32 } |
            | 2  | { id: 2, nickname: "Windrunner", name: "Kate", last name: "Smith", age: 28 } |
            | 3  | { id: 3, nickname: "Malfurion", name: "Eddie", last name: "Havoc", age: 27 } |
            | 4  | { id: 4, nickname: "Illidan", name: "Malcolm", last name: "Green", age: 23 } |
            | 0  | "Provided user id is invalid!"                                               |

    Scenario: get all games - testing /games endpoint

        * url baseUrl
        * path 'games'
        * method get
        * status 200
        * match response.games != []
        * match each response.games == { id: '#number', title: '#string', genre: '#string', released: '#number', ranking: '#number' }
        * print 'games response: ', response

    Scenario Outline: get game by id - testing /game/id endpoint

        * url baseUrl
        * path 'game/' + '<id>'
        * method get
        * status 200
        * def game = response
        * match game == <expectedResponse>

        Examples:
            | id | expectedResponse                                                                                 |
            | 1  | { id: 1, title: "Counter-Strike Global Offensive", genre: "Action", released: 2012, ranking: 4 } |
            | 2  | { id: 2, title: "Diablo 3", genre: "RPG", released: 2012,  ranking: 5 }                          |
            | 3  | { id: 3, title: "League of Legends", genre: "MOBA", released: 2009, ranking: 5 }                 |
            | 4  | { id: 4, title: "Tom Clancy Rainbow's six", genre: "Action", released: 2017, ranking: 4 }        |
            | 0  | "Provided game id is invalid!"                                                                   |
