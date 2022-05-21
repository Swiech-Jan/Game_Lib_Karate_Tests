Feature: Test Cases for all POST and Delete methods exposed by Express Sever

     # List of Test Cases:

     # Create new game and Delete - Scenario 1
     # Create new user and Delete - Scenario 2


    Background:
        * url baseUrl

    Scenario: Create new game and Delete

        # Add new game
        * path 'game/post'
        * request { "id": 99, "title": "TestTitle", "genre": "TestGenre", "released": 2030,  "ranking": 1 }
        * method post
        * status 200
        # Check if game was added
        * path 'game/99'
        * method get
        * status 200
        * match response == { id: 99, title: "TestTitle", genre: "TestGenre", released: 2030, ranking: 1 }
        # Delete Added game
        * path 'game/del/99'
        * method delete
        * status 200

    Scenario: Create new user and Delete

        # Add new user
        * path 'user/post'
        * request { "id": 99, "nickname": "TestNick", "name": "TestName", "lastName": "TestLastName", "password": "password01", "isAdmin": true, "age": 32 }
        * method post
        * status 200
        # Check if user was added
        * path 'user/99'
        * method get
        * status 200
        * match response == { id: 99, nickname: "TestNick", name: "TestName", lastName: "TestLastName", password: "password01", isAdmin: true, age: 32 }
        # Delete Added user
        * path 'user/del/99'
        * method delete
        * status 200