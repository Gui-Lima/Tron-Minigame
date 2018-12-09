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


    teleportMapCollision :: Position -> Map -> Bool
    teleportMapCollision pos map = if getPossible map pos == Teleportoso1 || getPossible map pos == Teleportoso2 || getPossible map pos == Teleportoso3
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

    outOfBounds :: Position -> Map -> Bool
    outOfBounds (x,y) map = (x<0 || x>69 || y < 0 || y > 69)

    possibleMovement :: Position -> Map -> Bool
    possibleMovement x m =  if not (outOfBounds x m)
                                then 
                                    not (wallCollision x m || traceCollision x m || playerCollision x m)
                                else
                                    False


    possibleMovementNoRules ::Position -> Map -> Bool
    possibleMovementNoRules x m = if not (outOfBounds x m )
                                        then
                                            not (wallCollision x m || playerCollision x m)
                                        else
                                            False