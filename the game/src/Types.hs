module Types where
    type Wall = (Float, Float)
    type Player = (Float, Float)
    type PowerUp = (Float, Float)
    type Trace = (Float, Float)
    type Nada = (Float, Float)
    type Position = (Float, Float)
    type Map = [[Possible]]
    type CoordMap = [[Position]]

    data Possible = Wall | Player | PowerUp | Trace | Nada
