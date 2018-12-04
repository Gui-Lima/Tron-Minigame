module Map where
    import Graphics.Gloss

    type Wall = (Float, Float)
    type Player = (Float, Float)
    type PowerUp = (Float, Float)
    type Trace = (Float, Float)
    type Nada = (Float, Float)
    type Position = (Float, Float)

    data Possible = Wall | Player | PowerUp | Trace | Nada

    initialMapStruct :: [[Possible]]
    initialMapStruct =   [[Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Player, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Player, Nada,Nada, Wall]
                         [Wall, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada, Nada,Nada, Wall]
                         [Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall, Wall,Wall, Wall]
                         ]

    getPoint :: (Float, Float) -> (Float, Float)
    getPoint (x,y) = (x*10+5, y*10+5)

    renderLine :: [Possible] -> [Position] -> Picture
    renderLine n m = map (paint n) m

    paint :: Possible -> Position -> Picture
    paint n (x,y)
                |  n == Nada = Pictures []
                |  n == Trace = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $ color red $ rectangleSolid 10 10]
                |  n == Wall = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $ color black $ rectangleSolid 10 10]
                |  n == Player = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $ color blue $ rectangleSolid 10 10]
                |  otherwise = Pictures []