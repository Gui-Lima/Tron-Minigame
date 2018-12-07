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
        , rules :: Int
        , gameIsOver :: Int
        } deriving (Show)


    -- Maps:
    -- 0 is the menu map
    -- 1 is a simple Map without any disruptions
    -- 2 is a map with a moving obstacle in the center
    -- 3 is a map with some random teleports

    -- Rules:
    -- 1 is normal Tron rules
    -- 2 is a fun play rule where you can't die