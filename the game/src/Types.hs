module Types where
    import Control.Concurrent

    type Wall = (Int, Int)
    type Player1 = MVar (Int, Int)
    type Player2 = MVar (Int, Int)
    type PowerUp = (Int, Int)
    type Teleport1 = (Int, Int)
    type Teleport2 = (Int, Int)
    type Teleport3 = (Int, Int)
    type MapTeleport = (Int, Int)
    type Trace1 = (Int, Int)
    type Trace2 = (Int, Int)
    type Nada = (Int, Int)
    type Position = (Int, Int)
    type Map = [[Possible]]
    type CoordMap = [[Position]]


    data Possible = Wall | Player1 | Player2 | PowerUp | Trace1 | Trace2 | Teleport1 | Teleport2 | Teleport3 | MapTeleport | Nada deriving (Eq, Show)
