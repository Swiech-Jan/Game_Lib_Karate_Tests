Feature: Test Cases for all GET methods exposed by Express Sever

     # List of Test Cases:

     # Get all games - Scenario 1
     # Get game by id - Scenario 2
     # Get all users - Scenario 3
     # Get user by id - Scenario 4
     # Get all reviews - Scenario 5
     # Get review by id - Scenario 6


    Background:
        * url baseUrl


    Scenario: get all games - testing /games endpoint

        * path 'games'
        * method get
        * status 200
        * match response != []
        * match each response == { id: '#number', title: '#string', genre: '#string', released: '#number', ranking: '#number' }
        * print 'games response: ', response

    Scenario Outline: get game by id - testing /game/id endpoint

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

    Scenario: get all users - testing /users endpoint

        * path 'users'
        * method get
        * status 200
        * match response != []
        * match each response == { id: '#number', nickname: '#string', firstName: '#string', lastName: '#string', password: "#string", isAdmin: "#boolean",  age: '#number' }
        * print 'users response: ', response

    Scenario Outline: get user by id - testing /user/id endpoint

        * path 'user/' + '<id>'
        * method get
        * status 200
        * def user = response
        * match user == <expectedResponse>

        Examples:
            | id | expectedResponse                                                                                                         |
            | 1  | { id: 1, nickname: "Hellscream", firstName: "John", lastName: "Black", password: "password01", isAdmin: true, age: 32 }  |
            | 2  | { id: 2, nickname: "Windrunner", firstName: "Kate", lastName: "Smith", password: "password02", isAdmin: false, age: 28 } |
            | 3  | { id: 3, nickname: "Malfurion", firstName: "Eddie", lastName: "Havoc", password: "password03", isAdmin: false, age: 27 } |
            | 4  | { id: 4, nickname: "Illidan", firstName: "Malcolm", lastName: "Green", password: "password04", isAdmin: false, age: 23 } |
            | 0  | "Provided user id is invalid!"                                                                                           |


    Scenario: get all reviews - testing /reviews endpoint

        * path 'reviews'
        * method get
        * status 200
        * match response != []
        * match each response == { idGame: '#number', stars: '#number', feedback: '#string' }
        * print 'reviews response: ', response

    Scenario Outline: get review by id - testing /review/id endpoint

        * path 'review/' + '<idGame>'
        * method get
        * status 200
        * def review = response
        * match review == <expectedResponse>

        Examples:
            | idGame | expectedResponse                                                     |
            | 1      | { idGame: 1, stars: 4.5, feedback: "Great game but very addictive" } |
            | 2      | { idGame: 2, stars: 5, feedback: "Amazing!" }                        |
            | 3      | { idGame: 3, stars: 5, feedback: "Great game but very toxic" }       |
            | 0      | "Provided review id is invalid!"                                     |





