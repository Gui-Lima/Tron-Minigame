module Types where
    type Wall = (Int, Int)
    type Player1 = (Int, Int)
    type Player2 = (Int, Int)
    type PowerUp = (Int, Int)
    type Trace1 = (Int, Int)
    type Trace2 = (Int, Int)
    type Nada = (Int, Int)
    type Position = (Int, Int)
    type Map = [[Possible]]
    type CoordMap = [[Position]]

    data Possible = Wall | Player1 | Player2 | PowerUp | Trace1 | Trace2 | Nada deriving (Eq, Show)
