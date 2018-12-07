module Events where
    import Types
    import MapFunctions
    import Map
    import Graphics.Gloss


    wallCollision :: Position -> Map -> Bool
    wallCollision pos map =  if getPossible map pos == Wall
                                        then
                                            True
                                        else
                                            False

    traceCollision :: Position -> Map -> Bool
    traceCollision pos map = if getPossible map pos == Trace1 || getPossible map pos == Trace2
                                        then
                                            True
                                        else
                                            False

    playerCollision :: Position -> Map -> Bool
    playerCollision pos map = if getPossible map pos == Player1 || getPossible map pos == Player2
                                        then
                                            True
                                        else
                                            False


    
    teleportCollision :: Position -> Map -> Bool
    teleportCollision pos map = if getPossible map pos == Teleport1 || getPossible map pos == Teleport2 || getPossible map pos == Teleport3
                                        then
                                            True
                                        else
                                            False

    possibleMovement :: Position -> Map -> Bool
    possibleMovement x m = not (wallCollision x m || traceCollision x m || playerCollision x m)