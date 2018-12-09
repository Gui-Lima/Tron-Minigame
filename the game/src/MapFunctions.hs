module MapFunctions where
    import Graphics.Gloss
    import Map
    import Types
    

    getPoint :: (Int, Int) -> (Float, Float)
    getPoint (x,y) = (-constX + offsetX, constY - offsetY)
        where
            floatedMapSizeX = fromIntegral (fst mapSize)
            floatedMapSizeY = fromIntegral (snd mapSize)
            floatedGridSize = fromIntegral gridSize
            floatedX = fromIntegral x
            floatedY = fromIntegral y
            constX = ((floatedMapSizeX * floatedGridSize)/2) - (floatedGridSize/2)
            constY = ((floatedMapSizeY * floatedGridSize)/2) - (floatedGridSize/2)
            offsetX = floatedX * floatedGridSize
            offsetY = floatedY * floatedGridSize


    getPossible :: Map -> Position -> Possible
    getPossible n (x,y) = (n !!  y) !! x

    getMap :: Map -> CoordMap -> Picture
    getMap map cMap= renderMap map cMap

    setPossiblesInPositions :: Map -> [Position] -> [Possible] -> Map
    setPossiblesInPositions m [] _ = m
    setPossiblesInPositions m pos@(x:xs) pob@(y:ys) = setPossiblesInPositions (setPossibleInPosition m x y) xs ys

    setPossibleInPosition :: Map -> Position -> Possible -> Map
    setPossibleInPosition map (x,y) p = take y map ++ [newList] ++ drop (y + 1) map
            where
                n = x
                xs = map !! y
                newList = take n xs ++ [p] ++ drop (n + 1) xs
    
    renderMap :: Map -> CoordMap -> Picture
    renderMap [] _ = Pictures []
    renderMap n@(x:xs) m@(y:ys) = Pictures [renderLine x y, renderMap xs ys]

    renderLine :: [Possible] -> [Position] -> Picture
    renderLine [] _ = Pictures []
    renderLine n@(x:xs) m@(y:ys) = Pictures [paint x y, renderLine xs ys]

    paint :: Possible -> Position -> Picture
    paint Nada (x,y) =      Pictures []
    paint Trace1 (x,y) =    Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $ color (light (light blue)) $ rectangleSolid 10 10]
    paint Trace2 (x,y) =    Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $ color (light (light red)) $ rectangleSolid 10 10]
    paint Wall (x,y)=       Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $  color black $ rectangleSolid 10 10]
    paint Player1 (x,y)=    Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $  color blue $ rectangleSolid 10 10]
    paint Player2 (x,y) =   Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $  color red $ rectangleSolid 10 10]
    paint Teleport1 (x,y) = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $  color magenta $ rectangleSolid 10 10]
    paint Teleport2 (x,y) = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $  color orange $ rectangleSolid 10 10]
    paint Teleport3 (x,y) = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $  color green $ rectangleSolid 10 10]
    paint MapTeleport (x,y) = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $  color chartreuse $ rectangleSolid 10 10]
    paint _ (x,y) = Pictures []