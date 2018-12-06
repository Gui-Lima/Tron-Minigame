module MapFunctions where
    import Graphics.Gloss
    import Map
    import Types
    
    

    getPoint :: (Int, Int) -> (Float, Float)
    getPoint (x,y) = (-const + offsetX, const - offsetY)
        where
            floatedMapSize = fromIntegral mapSize
            floatedGridSize = fromIntegral gridSize
            floatedX = fromIntegral x
            floatedY = fromIntegral y
            const = ((floatedMapSize * floatedGridSize)/2) - (floatedGridSize/2)
            offsetX = floatedX * floatedGridSize
            offsetY = floatedY * floatedGridSize


    getPossible :: Map -> Position -> Possible
    getPossible n (x,y) = (n !!  y) !! x

    getMap :: Map -> Picture
    getMap map = renderMap map mapCoords

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
    paint Nada (x,y) = Pictures []
    paint Trace1 (x,y) = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $ color blue $ rectangleSolid 10 10]
    paint Trace2 (x,y) = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $ color red $ rectangleSolid 10 10]
    paint Wall (x,y)= Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $  color black $ rectangleSolid 10 10]
    paint Player1 (x,y)= Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $  color (light blue) $ rectangleSolid 10 10]
    paint Player2 (x,y) = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $  color (light red) $ rectangleSolid 10 10]
