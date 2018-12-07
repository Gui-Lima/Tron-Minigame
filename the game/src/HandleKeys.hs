module HandleKeys where
    import TronGame
    import Graphics.Gloss
    import Graphics.Gloss.Interface.Pure.Game
    import Map
    import TronGame
    import Data


    handleKeys :: Event -> TronGame -> TronGame
    handleKeys (EventKey (Char 'r') _ _ _) game = initialState
    handleKeys (EventKey (Char 'w') _ _ _) game = if p1dead game && not (p2dead game)
                                                        then
                                                            Game {
                                                                tronMap = tronMap game
                                                            ,   mapId = mapId game
                                                            ,   player1 = player1 game
                                                            ,   player2 = player2 game
                                                            ,   p1xVel =  0
                                                            ,   p1yVel =  0
                                                            ,   p2xVel =  p2xVel game
                                                            ,   p2yVel =  p2yVel game
                                                            ,   p1Trace = p1Trace game
                                                            ,   p2Trace = p2Trace game
                                                            ,   p1dead = p1dead game
                                                            ,   p2dead = p2dead game
                                                            ,   rules = rules game
                                                            ,   gameIsOver = gameIsOver game
                                                            }
                                                        else
                                                            if p1dead game && p2dead game
                                                                then
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                    ,   mapId = mapId game                                                                        
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  0
                                                                    ,   p1yVel =  0
                                                                    ,   p2xVel =  0
                                                                    ,   p2yVel =  0
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }
                                                                else
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                    ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  0
                                                                    ,   p1yVel =  -initialSpeed
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }

    handleKeys (EventKey (Char 'd') _ _ _) game = if p1dead game && not (p2dead game)
                                                        then
                                                            Game {
                                                                tronMap = tronMap game
                                                                ,   mapId = mapId game
                                                            ,   player1 = player1 game
                                                            ,   player2 = player2 game
                                                            ,   p1xVel =  0
                                                            ,   p1yVel =  0
                                                            ,   p2xVel =  p2xVel game
                                                            ,   p2yVel =  p2yVel game
                                                            ,   p1Trace = p1Trace game
                                                            ,   p2Trace = p2Trace game
                                                            ,   p1dead = p1dead game
                                                            ,   p2dead = p2dead game
                                                            ,   rules = rules game
                                                            ,   gameIsOver = gameIsOver game
                                                            }
                                                        else
                                                           if p1dead game && p2dead game
                                                                then
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                        ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  0
                                                                    ,   p1yVel =  0
                                                                    ,   p2xVel =  0
                                                                    ,   p2yVel =  0
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }
                                                                else
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                        ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  initialSpeed
                                                                    ,   p1yVel =  0
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }

    handleKeys (EventKey (Char 'a') _ _ _) game = if p1dead game && not (p2dead game)
                                                        then
                                                            Game {
                                                                tronMap = tronMap game
                                                                ,   mapId = mapId game
                                                            ,   player1 = player1 game
                                                            ,   player2 = player2 game
                                                            ,   p1xVel =  0
                                                            ,   p1yVel =  0
                                                            ,   p2xVel =  p2xVel game
                                                            ,   p2yVel =  p2yVel game
                                                            ,   p1Trace = p1Trace game
                                                            ,   p2Trace = p2Trace game
                                                            ,   p1dead = p1dead game
                                                            ,   p2dead = p2dead game
                                                            ,   rules = rules game
                                                            ,   gameIsOver = gameIsOver game
                                                            }
                                                        else
                                                            if p1dead game && p2dead game
                                                                then
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                        ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  0
                                                                    ,   p1yVel =  0
                                                                    ,   p2xVel =  0
                                                                    ,   p2yVel =  0
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }
                                                                else
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                        ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  -initialSpeed
                                                                    ,   p1yVel =  0
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }

    handleKeys (EventKey (SpecialKey KeyUp) _ _ _) game = if p2dead game && not (p1dead game)
                                                                then
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                        ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  p1xVel game
                                                                    ,   p1yVel =  p1yVel game
                                                                    ,   p2xVel =  0
                                                                    ,   p2yVel =  0
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }
                                                                else
                                                                    if p1dead game && p2dead game
                                                                        then
                                                                            Game {
                                                                                tronMap = tronMap game
                                                                                ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  0
                                                                            ,   p1yVel =  0
                                                                            ,   p2xVel =  0
                                                                            ,   p2yVel =  0
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            }
                                                                        else
                                                                            Game {
                                                                                tronMap = tronMap game
                                                                                ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  p1xVel game
                                                                            ,   p1yVel =  p1yVel game
                                                                            ,   p2xVel =  0
                                                                            ,   p2yVel =  -initialSpeed
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            }
        
    handleKeys (EventKey (SpecialKey KeyDown) _ _ _) game = if p2dead game && not (p1dead game)
                                                                then
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                        ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  p1xVel game
                                                                    ,   p1yVel =  p1yVel game
                                                                    ,   p2xVel =  0
                                                                    ,   p2yVel =  0
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }
                                                                else
                                                                    if p1dead game && p2dead game
                                                                        then
                                                                            Game {
                                                                                tronMap = tronMap game
                                                                                ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  0
                                                                            ,   p1yVel =  0
                                                                            ,   p2xVel =  0
                                                                            ,   p2yVel =  0
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            }
                                                                        else
                                                                            Game {
                                                                                tronMap = tronMap game
                                                                                ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  p1xVel game
                                                                            ,   p1yVel =  p1yVel game
                                                                            ,   p2xVel =  0
                                                                            ,   p2yVel =  initialSpeed
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            }
        
    handleKeys (EventKey (SpecialKey KeyLeft) _ _ _) game = if p2dead game && not (p1dead game)
                                                                then
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                        ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  p1xVel game
                                                                    ,   p1yVel =  p1yVel game
                                                                    ,   p2xVel =  0
                                                                    ,   p2yVel =  0
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }
                                                                else
                                                                    if p1dead game && p2dead game
                                                                        then
                                                                            Game {
                                                                                tronMap = tronMap game
                                                                                ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  0
                                                                            ,   p1yVel =  0
                                                                            ,   p2xVel =  0
                                                                            ,   p2yVel =  0
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            }
                                                                        else
                                                                            Game {
                                                                                tronMap = tronMap game
                                                                                ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  p1xVel game
                                                                            ,   p1yVel =  p1yVel game
                                                                            ,   p2xVel =  - initialSpeed
                                                                            ,   p2yVel =  0
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            }
        
    handleKeys (EventKey (SpecialKey KeyRight) _ _ _) game = if p2dead game && not (p1dead game)
                                                                then
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                        ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  p1xVel game
                                                                    ,   p1yVel =  p1yVel game
                                                                    ,   p2xVel =  0
                                                                    ,   p2yVel =  0
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }
                                                                else
                                                                    if p1dead game && p2dead game
                                                                        then
                                                                            Game {
                                                                                tronMap = tronMap game
                                                                                ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  0
                                                                            ,   p1yVel =  0
                                                                            ,   p2xVel =  0
                                                                            ,   p2yVel =  0
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            }
                                                                        else
                                                                            Game {
                                                                                tronMap = tronMap game
                                                                                ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  p1xVel game
                                                                            ,   p1yVel =  p1yVel game
                                                                            ,   p2xVel =  initialSpeed
                                                                            ,   p2yVel =  0
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            }
        
    handleKeys (EventKey (Char 's') _ _ _) game = if p1dead game && not (p2dead game)
                                                        then
                                                            Game {
                                                                tronMap = tronMap game
                                                                ,   mapId = mapId game
                                                            ,   player1 = player1 game
                                                            ,   player2 = player2 game
                                                            ,   p1xVel =  0
                                                            ,   p1yVel =  0
                                                            ,   p2xVel =  p2xVel game
                                                            ,   p2yVel =  p2yVel game
                                                            ,   p1Trace = p1Trace game
                                                            ,   p2Trace = p2Trace game
                                                            ,   p1dead = p1dead game
                                                            ,   p2dead = p2dead game
                                                            ,   rules = rules game
                                                            ,   gameIsOver = gameIsOver game
                                                            }
                                                        else
                                                            if p1dead game && p2dead game
                                                                then
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                        ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  0
                                                                    ,   p1yVel =  0
                                                                    ,   p2xVel =  0
                                                                    ,   p2yVel =  0
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }
                                                                else
                                                                    Game {
                                                                        tronMap = tronMap game
                                                                        ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  0
                                                                    ,   p1yVel =  initialSpeed
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }

    handleKeys _ game = game