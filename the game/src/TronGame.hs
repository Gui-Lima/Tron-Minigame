module TronGame where
    import Graphics.Gloss
    import Types
    import MapFunctions
    import Map

    initialPoint1 :: Position
    initialPoint1 = (1,1)

    initialPoint2 :: Position
    initialPoint2 = (68,68)

    initialSpeed :: Int
    initialSpeed = 1

    data TronGame = Game    
        { tronMap :: Map
        , player1 :: Position
        , player2 :: Position 
        , p1xVel :: Int
        , p2xVel :: Int
        , p1yVel :: Int
        , p2yVel :: Int
        , p1Trace :: [Position]
        , p2Trace :: [Position]
        , p1dead :: Bool
        , p2dead :: Bool
        } deriving (Show)

    initialState :: TronGame
    initialState = Game
        {
            tronMap = obstacleMap
        ,   player1 = initialPoint1
        ,   player2 = initialPoint2
        ,   p1xVel =  initialSpeed
        ,   p1yVel = 0
        ,   p2xVel = -initialSpeed
        ,   p2yVel = 0
        ,   p1Trace = [initialPoint1]
        ,   p2Trace = [initialPoint2]
        ,   p1dead = False
        ,   p2dead = False
        }


    render :: TronGame -> Picture
    render game = getMap (tronMap game)