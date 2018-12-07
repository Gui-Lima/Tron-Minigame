module TronGame where
    import Graphics.Gloss
    import Types
    import MapFunctions
    import Map

    data TronGame = Game    
        { tronMap :: Map
        , mapId   :: Int
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

    
    render :: TronGame -> Picture
    render game = getMap (tronMap game)