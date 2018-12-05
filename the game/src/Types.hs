module Types where
    type Wall = (Int, Int)
    type Player = (Int, Int)
    type PowerUp = (Int, Int)
    type Trace = (Int, Int)
    type Nada = (Int, Int)
    type Position = (Int, Int)
    type Map = [[Possible]]
    type CoordMap = [[Position]]

    data Possible = Wall | Player | PowerUp | Trace | Nada deriving (Eq, Show)
