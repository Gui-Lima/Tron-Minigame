module Data where
    import Types
    import TronGame
    import Map

    initialPointMap1Player1 :: Position
    initialPointMap1Player1 = (1,1)

    initialPointMap1Player2 :: Position
    initialPointMap1Player2 = (1,68)

    initialPointMap2Player1 :: Position
    initialPointMap2Player1 = (1,1)

    initialPointMap2Player2 :: Position
    initialPointMap2Player2 = (68, 68)

    initialPointMap3Player1 :: Position
    initialPointMap3Player1 = (20, 20)

    initialPointMap3Player2 :: Position
    initialPointMap3Player2 = (60, 60)

    initialSpeed :: Int
    initialSpeed = 1


    initialState :: TronGame
    initialState = Game
        {
            tronMap = menuMap
        ,   mapId = 0
        ,   player1 = initialPointMap1Player1
        ,   player2 = initialPointMap1Player2
        ,   p1xVel =  initialSpeed
        ,   p1yVel = 0
        ,   p2xVel = initialSpeed
        ,   p2yVel = 0
        ,   p1Trace = [initialPointMap1Player1]
        ,   p2Trace = [initialPointMap1Player2]
        ,   p1dead = False
        ,   p2dead = False
        ,   rules = 2
        }

    map1State :: TronGame
    map1State = Game
        {
            tronMap = simpleMap
        ,   mapId = 1
        ,   player1 = initialPointMap2Player1
        ,   player2 = initialPointMap2Player2
        ,   p1xVel =  initialSpeed
        ,   p1yVel = 0
        ,   p2xVel = -initialSpeed
        ,   p2yVel = 0
        ,   p1Trace = [initialPointMap1Player1]
        ,   p2Trace = [initialPointMap1Player2]
        ,   p1dead = False
        ,   p2dead = False
        ,   rules = 1
        }

    map2State :: TronGame
    map2State = Game
        {
            tronMap = obstacleMap
        ,   mapId = 2
        ,   player1 = initialPointMap3Player1
        ,   player2 = initialPointMap3Player2
        ,   p1xVel =  initialSpeed
        ,   p1yVel = 0
        ,   p2xVel = -initialSpeed
        ,   p2yVel = 0
        ,   p1Trace = [initialPointMap1Player1]
        ,   p2Trace = [initialPointMap1Player2]
        ,   p1dead = False
        ,   p2dead = False
        ,   rules = 1
        } 