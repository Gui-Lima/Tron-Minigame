module Actions where
    import Types
    import Graphics.Gloss
    import TronGame
    import Map
    import MapFunctions
    import Events
    import Data



    endGame :: TronGame -> TronGame
    endGame game = if p1Death 
                            then 
                                if p2Death
                                    then
                                        Game{
                                            tronMap = tronMap game
                                        ,   mapId = mapId game
                                        ,   player1 = player1 game
                                        ,   player2 = player2 game
                                        ,   p1xVel = p1xVel game
                                        ,   p1yVel = p1yVel game
                                        ,   p2xVel = p2xVel game
                                        ,   p2yVel = p2yVel game
                                        ,   p1Trace = p1Trace game
                                        ,   p2Trace = p2Trace game
                                        ,   p1dead = True
                                        ,   p2dead = True
                                        ,   rules = 2
                                        ,   gameIsOver = 3
                                        }
                                    else
                                        Game{
                                            tronMap = tronMap game
                                        ,   mapId = mapId game
                                        ,   player1 = player1 game
                                        ,   player2 = player2 game
                                        ,   p1xVel = p1xVel game
                                        ,   p1yVel = p1yVel game
                                        ,   p2xVel = p2xVel game
                                        ,   p2yVel = p2yVel game
                                        ,   p1Trace = p1Trace game
                                        ,   p2Trace = p2Trace game
                                        ,   p1dead = True
                                        ,   p2dead = False
                                        ,   rules = 2
                                        ,   gameIsOver = 2
                                        }
                            else
                                if p2Death
                                    then 
                                        Game{
                                            tronMap = tronMap game
                                        ,   mapId = mapId game
                                        ,   player1 = player1 game
                                        ,   player2 = player2 game
                                        ,   p1xVel = p1xVel game
                                        ,   p1yVel = p1yVel game
                                        ,   p2xVel = p2xVel game
                                        ,   p2yVel = p2yVel game
                                        ,   p1Trace = p1Trace game
                                        ,   p2Trace = p2Trace game
                                        ,   p1dead = False
                                        ,   p2dead = True
                                        ,   rules = 2
                                        ,   gameIsOver = 1
                                        }

                                    else
                                        Game{
                                            tronMap = tronMap game
                                        ,   mapId = mapId game
                                        ,   player1 = player1 game
                                        ,   player2 = player2 game
                                        ,   p1xVel = p1xVel game
                                        ,   p1yVel = p1yVel game
                                        ,   p2xVel = p2xVel game
                                        ,   p2yVel = p2yVel game
                                        ,   p1Trace = p1Trace game
                                        ,   p2Trace = p2Trace game
                                        ,   p1dead = p1dead game
                                        ,   p2dead = p2dead game
                                        ,   rules = rules game
                                        ,   gameIsOver = 0
                                        }
            where
                p2Death = p2dead game
                p1Death = p1dead game

    menuTeleport :: TronGame -> TronGame
    menuTeleport game = if teleportCollision p1Move momentMap
                                then
                                    if (getPossible momentMap p1Move) == Teleport1
                                        then map1State
                                    else
                                        if (getPossible momentMap p1Move) == Teleport2
                                            then map2State
                                        else
                                            map3State
                        else
                            game
            where
                momentMap = tronMap game
                (x,y) = player1 game
                p1Move = ((x + p1xVel game)  , (y + p1yVel game))

    movePlayer :: TronGame -> TronGame
    movePlayer game = if rules game == 1
                            then    
                                Game {
                                        tronMap = newMap
                                    ,   mapId = mapId game
                                    ,   player1 = p1NewPos
                                    ,   player2 = p2NewPos
                                    ,   p1xVel  = p1xVel game
                                    ,   p1yVel  = p1yVel game
                                    ,   p2xVel  = p2xVel game
                                    ,   p2yVel  = p2yVel game
                                    ,   p1Trace = p1NewPos : (p1Trace game)
                                    ,   p2Trace = p2NewPos : (p2Trace game)
                                    ,   p1dead = newStatus1
                                    ,   p2dead = newStatus2
                                    ,   rules = 1
                                    ,   gameIsOver = gameIsOver game
                                    }
                            else
                                Game {
                                        tronMap = newMapNoRules
                                    ,   mapId = mapId game
                                    ,   player1 = p1NewPosNoRules
                                    ,   player2 = p2NewPosNoRules
                                    ,   p1xVel  = p1xVel game
                                    ,   p1yVel  = p1yVel game
                                    ,   p2xVel  = p2xVel game
                                    ,   p2yVel  = p2yVel game
                                    ,   p1Trace = p1NewPosNoRules : (p1Trace game)
                                    ,   p2Trace = p2NewPosNoRules : (p2Trace game)
                                    ,   p1dead = p1dead game
                                    ,   p2dead = p1dead game
                                    ,   rules = 2
                                    ,   gameIsOver = gameIsOver game
                                    }
                                    where
                                        (x,y) = player1 game
                                        (u,v) = player2 game
                                        (p1movementX, p1movementY) =  ((x + p1xVel game)  , (y + p1yVel game))
                                        (p2movementX, p2movementY) =  ((u + p2xVel game)  , (v + p2yVel game))
                                        p1NewPos = if possibleMovement (p1movementX, p1movementY)  (tronMap game)
                                                            then
                                                                (p1movementX, p1movementY)
                                                            else
                                                                (x, y)
                                        p2NewPos = if possibleMovement (p2movementX, p2movementY) (tronMap game)
                                                            then
                                                                (p2movementX, p2movementY)
                                                            else
                                                                (u, v)
                                        p1NewPosNoRules = if possibleMovementNoRules (p1movementX, p1movementY)  (tronMap game)
                                                            then
                                                                (p1movementX, p1movementY)
                                                            else
                                                                (x, y)
                                        p2NewPosNoRules = if possibleMovementNoRules (p2movementX, p2movementY) (tronMap game)
                                                            then
                                                                (p2movementX, p2movementY)
                                                            else
                                                                (u, v)
                                        
                                        newStatus1 = if possibleMovement (p1movementX, p1movementY) (tronMap game)
                                                            then
                                                                False
                                                            else
                                                                True 
                                        newStatus2 = if possibleMovement (p2movementX, p2movementY) (tronMap game)
                                                            then
                                                                False
                                                            else
                                                                True
                                        newMap = setPossiblesInPositions  (tronMap game) [(player1 game), (player2 game), p1NewPos, p2NewPos] [Trace1, Trace2, Player1, Player2]
                                        newMapNoRules = setPossiblesInPositions  (tronMap game) [(player1 game), (player2 game), p1NewPosNoRules, p2NewPosNoRules] [Trace1, Trace2, Player1, Player2]