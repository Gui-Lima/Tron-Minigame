module HandleKeys where
    import TronGame
    import Graphics.Gloss
    import Graphics.Gloss.Interface.Pure.Game
    import Map
    import TronGame
    import Data
    import Control.Concurrent

    handleKeys :: Event -> (TronGame, (MVar Int)) -> IO (TronGame, (MVar Int))
    handleKeys (EventKey (Char 'r') _ _ _) (game, p1Control) = return (initialState, p1Control)
    handleKeys (EventKey (Char 'w') _ _ _) (game, p1Control) = do 
                                                                v <- takeMVar p1Control
                                                                putMVar p1Control (v)
                                                                return (Game {
                                                                        tronMap = tronMap game
                                                                    ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  0
                                                                    ,   p1yVel =  -v
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }, p1Control)

    handleKeys (EventKey (Char 'd') _ _ _) (game, p1Control) = do
                                                                v <- takeMVar p1Control
                                                                putMVar p1Control (v)
                                                                return (Game {
                                                                        tronMap = tronMap game
                                                                    ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  v
                                                                    ,   p1yVel =  0
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }, p1Control)

    handleKeys (EventKey (Char 'a') _ _ _) (game, p1Control) = do
                                                                    v <- takeMVar p1Control
                                                                    putMVar p1Control (v)
                                                                    return (Game {
                                                                        tronMap = tronMap game
                                                                    ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  -v
                                                                    ,   p1yVel =  0
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    }, p1Control)

    handleKeys (EventKey (SpecialKey KeyUp) _ _ _) (game, p1Control) = do
                                                                            v <- takeMVar p1Control
                                                                            putMVar p1Control (v)
                                                                            return (Game {
                                                                                tronMap = tronMap game
                                                                            ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  p1xVel game
                                                                            ,   p1yVel =  p1yVel game
                                                                            ,   p2xVel =  0
                                                                            ,   p2yVel =  -v
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            }, p1Control)
        
    handleKeys (EventKey (SpecialKey KeyDown) _ _ _) (game, p1Control) = do
                                                                            v <- takeMVar p1Control
                                                                            putMVar p1Control (v)
                                                                            return (Game {
                                                                                tronMap = tronMap game
                                                                            ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  p1xVel game
                                                                            ,   p1yVel =  p1yVel game
                                                                            ,   p2xVel =  0
                                                                            ,   p2yVel =  v
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            }, p1Control)
        
    handleKeys (EventKey (SpecialKey KeyLeft) _ _ _) (game, p1Control) = do
                                                                            v <- takeMVar p1Control
                                                                            putMVar p1Control (v)
                                                                            return (Game {
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
                                                                            }, p1Control)
        
    handleKeys (EventKey (SpecialKey KeyRight) _ _ _) (game, p1Control) = do
                                                                            v <- takeMVar p1Control
                                                                            putMVar p1Control (v)
                                                                            return (Game {
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
                                                                            }, p1Control)
        
    handleKeys (EventKey (Char 's') _ _ _) (game, p1Control) = do 
                                                                    v <- takeMVar p1Control
                                                                    putMVar p1Control (v)
                                                                    return (Game {
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
                                                                    }, p1Control)

    handleKeys _ (game, p1Control) =return (game, p1Control)