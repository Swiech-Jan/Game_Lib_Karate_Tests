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
        * match each response.users == { id: '#number', nickname: '#string', name: '#string', last name: '#string', password: "#string", is admin: "#boolean",  age: '#number' }
        * print 'users response: ', response

    Scenario Outline: get user by id - testing /user/id endpoint

        * url baseUrl
        * path 'user/' + '<id>'
        * method get
        * status 200
        * def user = response
        * match user == <expectedResponse>

        Examples:
            | id | expectedResponse                                                                                                      |
            | 1  | { id: 1, nickname: "Hellscream", name: "John", last name: "Black", password: "password01", is admin: true, age: 32 }  |
            | 2  | { id: 2, nickname: "Windrunner", name: "Kate", last name: "Smith", password: "password02", is admin: false, age: 28 } |
            | 3  | { id: 3, nickname: "Malfurion", name: "Eddie", last name: "Havoc", password: "password03", is admin: false, age: 27 } |
            | 4  | { id: 4, nickname: "Illidan", name: "Malcolm", last name: "Green", password: "password04", is admin: false, age: 23 } |
            | 0  | "Provided user id is invalid!"                                                                                        |

    Scenario: get all games - testing /games endpoint

        * url baseUrl
        * path 'games'
        * method get
        * status 200
        * match response != []
        * match each response == { id: '#number', title: '#string', genre: '#string', released: '#number', ranking: '#number' }
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
            | 0  | "Provided game id is invalid!"                                                                   |


    Scenario: get all reviews - testing /reviews endpoint

        * url baseUrl
        * path 'reviews'
        * method get
        * status 200
        * match response.reviews != []
        * match each response.reviews == { id: '#number', game: '#string', stars: '#number', feedback: '#string' }
        * print 'reviews response: ', response

    Scenario Outline: get review by id - testing /review/id endpoint

        * url baseUrl
        * path 'review/' + '<id>'
        * method get
        * status 200
        * def review = response
        * match review == <expectedResponse>

        Examples:
            | id | expectedResponse                                                                                          |
            | 1  | { id: 1, game: "Counter-Strike Global Offensive", stars: 4.5, feedback: "Great game but very addictive" } |
            | 2  | { id: 2, game: "Diablo 3", stars: 5, feedback: "Amazing!" }                                               |
            | 3  | { id: 3, game: "League of Legends", stars: 5, feedback: "Great game but very toxic" }                     |
            | 0  | "Provided review id is invalid!"                                                                          |





