Feature: Test Cases for all PUT methods exposed by Express Server

     # List of Test Cases:

     # Update first existing game and verify - Scenario 1
     # Update first existing user and verify - Scenario 2
     # Update first existing review and verify - Scenario 3


    Background:
        * url baseUrl

    Scenario: Update first existing game and verify

        # Update existing game
        * path 'game/update/1'
        * request { title: "Test_Counter-Strike Global Offensive", genre: "Test_Action", released: 2015, ranking: 3 }
        * method put
        * status 200
        # Check if game was updated
        * path 'game/1'
        * method get
        * status 200
        * match response == { id: 1, title: "Test_Counter-Strike Global Offensive", genre: "Test_Action", released: 2015, ranking: 3 }

    Scenario: Update first existing user and verify

        # Update existing user
        * path 'user/update/1'
        * request { nickname: "Test_Hellscream", firstName: "Test_John", lastName: "Test_Black", password: "Test_password01", isAdmin: true, age: 32 }
        * method put
        * status 200
        # Check if user was updated
        * path 'user/1'
        * method get
        * status 200
        * match response == { id: 1, nickname: "Test_Hellscream", firstName: "Test_John", lastName: "Test_Black", password: "Test_password01", isAdmin: true, age: 32 }

    Scenario: Update first existing review and verify

        # Update existing review
        * path 'review/update/1'
        * request { stars: 4.5, feedback: "Test_Great game but very addictive" }
        * method put
        * status 200
        # Check if review was updated
        * path 'review/1'
        * method get
        * status 200
        * match response == { idGame: 1, stars: 4.5, feedback: "Test_Great game but very addictive" }
