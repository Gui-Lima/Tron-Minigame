module Actions where
    import Types
    import Graphics.Gloss
    import TronGame
    import Map
    import MapFunctions
    import Events
    import Data
    import Control.Concurrent

    teleportPlayer1 :: TronGame -> TronGame
    teleportPlayer1 game = Game {
                                        tronMap = tronMap game
                                    ,   mapId = mapId game
                                    ,   player1 = (3,3)
                                    ,   player2 = player2 game
                                    ,   p1xVel  = p1xVel game
                                    ,   p1yVel  = p1yVel game
                                    ,   p2xVel  = p2xVel game
                                    ,   p2yVel  = p2yVel game
                                    ,   p1Trace = (3,3) : (p1Trace game)
                                    ,   p2Trace = (p2Trace game)
                                    ,   p1dead = p1dead game
                                    ,   p2dead = p2dead game
                                    ,   rules = rules game
                                    ,   gameIsOver = gameIsOver game
                                    }


    teleportPlayer2 :: TronGame -> TronGame
    teleportPlayer2 game = Game {
                                        tronMap = tronMap game
                                    ,   mapId = mapId game
                                    ,   player1 = player1 game
                                    ,   player2 = (5,5)
                                    ,   p1xVel  = p1xVel game
                                    ,   p1yVel  = p1yVel game
                                    ,   p2xVel  = p2xVel game
                                    ,   p2yVel  = p2yVel game
                                    ,   p1Trace = (p1Trace game)
                                    ,   p2Trace = (5,5) : (p2Trace game)
                                    ,   p1dead = p1dead game
                                    ,   p2dead = p2dead game
                                    ,   rules = rules game
                                    ,   gameIsOver = gameIsOver game
                                    }

    mapTeleport :: TronGame -> (MVar Bool) -> (MVar Bool) -> (MVar Bool)-> IO TronGame
    mapTeleport game t1var t2var t3var      = do
                                                t1 <- takeMVar t1var
                                                t2 <- takeMVar t2var
                                                t3 <- takeMVar t3var
                                                if teleportMapCollision p1 (tronMap game)
                                                            then
                                                                if getPossible (tronMap game) p1 == Teleportoso1 && t1 == False
                                                                    then
                                                                        do
                                                                            putMVar t1var True
                                                                            putMVar t2var False
                                                                            putMVar t3var False
                                                                            return (teleportPlayer1 game)
                                                                    else
                                                                        if getPossible (tronMap game) p1 == Teleportoso2 && t2 == False
                                                                            then
                                                                                do
                                                                                    putMVar t2var True
                                                                                    putMVar t1var False
                                                                                    putMVar t3var False
                                                                                    return (teleportPlayer1 game)
                                                                        else
                                                                            if getPossible (tronMap game) p1 == Teleportoso3 && t3 == False
                                                                                then
                                                                                    do
                                                                                        putMVar t3var True
                                                                                        putMVar t1var False
                                                                                        putMVar t2var False
                                                                                        return (teleportPlayer1 game)
                                                                                else
                                                                                    do
                                                                                        putMVar t3var False
                                                                                        putMVar t1var False
                                                                                        putMVar t2var False
                                                                                        return game
                                                                            
                                                        else
                                                            if teleportMapCollision p2 (tronMap game)
                                                                then
                                                                    if getPossible (tronMap game) p2 == Teleportoso1 && t1 == False
                                                                        then
                                                                            do
                                                                                putMVar t3var False
                                                                                putMVar t1var True
                                                                                putMVar t2var False
                                                                                return (teleportPlayer2 game)
                                                                        else
                                                                            if getPossible (tronMap game) p2 == Teleportoso2 && t2 == False
                                                                                then
                                                                                    do
                                                                                        putMVar t3var False
                                                                                        putMVar t1var False
                                                                                        putMVar t2var True
                                                                                        return (teleportPlayer2 game)
                                                                            else
                                                                                if getPossible (tronMap game) p2 == Teleportoso3 && t3 == False
                                                                                    then
                                                                                        do
                                                                                            putMVar t3var True
                                                                                            putMVar t1var False
                                                                                            putMVar t2var False
                                                                                            return (teleportPlayer2 game)
                                                                                    else
                                                                                        do
                                                                                            putMVar t3var False
                                                                                            putMVar t1var False
                                                                                            putMVar t2var False
                                                                                            return game
                                                            else
                                                                do
                                                                    putMVar t1var False
                                                                    putMVar t2var False
                                                                    putMVar t3var False
                                                                    return game
                                                                
            where 
                futureGame = movePlayer game
                p1 = player1 futureGame
                p2 = player2 futureGame


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
                                        ,   p1dead = p1dead game
                                        ,   p2dead = p2dead game
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
                                        ,   p1dead = p1dead game
                                        ,   p2dead = p2dead game
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
                                        ,   p1dead = p1dead game
                                        ,   p2dead = p2dead game
                                        ,   rules = 2
                                        ,   gameIsOver = 1
                                        }

                                    else
                                        game
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
    movePlayer game = if (rules game) == 1
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
                                    ,   rules = rules game
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
                                    ,   rules = rules game
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
                                                                (x,y)
                                        p2NewPos = if possibleMovement (p2movementX, p2movementY) (tronMap game)
                                                            then
                                                                (p2movementX, p2movementY)
                                                            else
                                                                (u,v)
                                        p1NewPosNoRules = if possibleMovementNoRules (p1movementX, p1movementY)  (tronMap game)
                                                            then
                                                                (p1movementX, p1movementY)
                                                            else
                                                                (x,y)
                                        p2NewPosNoRules = if possibleMovementNoRules (p2movementX, p2movementY) (tronMap game)
                                                            then
                                                                (p2movementX, p2movementY)
                                                            else
                                                                (u,v)
                                        
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
                                                            