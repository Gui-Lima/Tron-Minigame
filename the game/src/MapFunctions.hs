module MapFunctions where
    import Graphics.Gloss
    import Map
    import Types
    
    

    getPoint :: (Int, Int) -> (Float, Float)
    getPoint (x,y) = ( (floatedX*floatedGridSize)-(floatedGridSize/2) ,  offset - (floatedY*floatedGridSize) - (floatedGridSize/2) )
        where
            floatedX = fromIntegral x
            floatedY = fromIntegral y
            offset = floatedGridSize * (fromIntegral mapSize)
            floatedGridSize = fromIntegral gridSize

    getPossible :: Map -> Position -> Possible
    getPossible n (x,y) = (n !!  x) !! y

    getMap :: Map -> Picture
    getMap map = renderMap map mapCoords

    setPossiblesInPositions :: Map -> [Position] -> [Possible] -> Map
    setPossiblesInPositions m [] _ = m
    setPossiblesInPositions m pos@(x:xs) pob@(y:ys) = setPossiblesInPositions (setPossibleInPosition m x y) xs ys

    setPossibleInPosition :: Map -> Position -> Possible -> Map
    setPossibleInPosition map (x,y) p = take x map ++ [newList] ++ drop (x + 1) map
            where
                n = y
                xs = map !! x
                newList = take n xs ++ [p] ++ drop (n + 1) xs
    
    renderMap :: Map -> CoordMap -> Picture
    renderMap [] _ = Pictures []
    renderMap n@(x:xs) m@(y:ys) = Pictures [renderLine x y, renderMap xs ys]

    renderLine :: [Possible] -> [Position] -> Picture
    renderLine [] _ = Pictures []
    renderLine n@(x:xs) m@(y:ys) = Pictures [paint x y, renderLine xs ys]

    paint :: Possible -> Position -> Picture
    paint Nada (x,y) = Pictures []
    paint Trace (x,y) = Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $ color red $ rectangleSolid 10 10]
    paint Wall (x,y)= Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $ color black $ rectangleSolid 10 10]
    paint Player (x,y)= Pictures [translate (fst (getPoint (x,y))) (snd (getPoint (x,y))) $ color blue $ rectangleSolid 10 10]
