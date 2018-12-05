module Events where
    import Types
    import Map
    import Graphics.Gloss


    wallCollision :: Position -> Map -> Bool
    wallCollision pos map =  if getPossible map pos == Wall
                                        then
                                            True
                                        else
                                            False

    traceCollision :: Position -> Map -> Bool
    traceCollision pos map = if getPossible map pos == Trace
                                        then
                                            True
                                        else
                                            False

    possibleMovement :: Position -> Map -> Bool
    possibleMovement x m= not (wallCollision x m || traceCollision x m)