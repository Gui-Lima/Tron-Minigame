module Main(main) where
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

-- The game setup
data TronGame = Game    
    { player1 :: (Float, Float)
    , player2 :: (Float, Float) 
    , p1xVel :: (Float)
    , p2xVel :: (Float)
    , p1yVel :: (Float)
    , p2yVel :: (Float)
    , p1Trace :: [(Float, Float)]
    , p2Trace ::[(Float, Float)]
    } deriving Show

initialState :: TronGame
initialState = Game
    {
        player1 = initialPoint1
    ,   player2 = initialPoint2
    ,   p1xVel = speed
    ,   p1yVel = 0
    ,   p2yVel = speed
    ,   p2xVel = 0
    ,   p1Trace = [initialPoint1]
    ,   p2Trace = [initialPoint2]
    }


render :: TronGame -> Picture
render game = pictures [
                        limits,
                        traces,
                        paddles
                        ]
    where
        paddles = pictures [mkPaddle blue (fst (player1 game))(snd(player1 game)),mkPaddle red (fst (player2 game))(snd(player2 game))]
        limits = pictures [rotate 90 $ wall (greyN 0.5) 0 150, rotate 90 $ wall (greyN 0.5) 0 (-150), wall (greyN 0.5) 0 150, wall (greyN 0.5) 0 (-150)]
        traces = pictures [mkTrace (light (light blue)) ((player1 game):(p1Trace game)), mkTrace (light (light red)) ((player2 game):(p2Trace game))]
   
-- Some parameters
background = white
fps = 20
limits = [(0, 150), (0, (-150)), (150, 0), ((-150), 0)]
speed = 30

playerSize :: (Float, Float)
playerSize = (10, 10)

initialPoint1 :: (Float, Float)
initialPoint1 = (0, -100)

initialPoint2 :: (Float, Float)
initialPoint2 = (100, 0)

-- Factories
wall :: Color -> Float -> Float -> Picture
wall wallColor x y = translate x y $ color wallColor $ rectangleSolid 270 10

mkPaddle :: Color -> Float -> Float -> Picture
mkPaddle col x y = pictures
    [ translate x y $ color col $ rectangleSolid (fst playerSize) (snd playerSize)]

mkTrace :: Color -> [(Float, Float)] -> Picture
mkTrace _ [] = pictures []
mkTrace col n@((x,y):(u,v):z) = if x - u /= 0 
                                    then 
                                        if u-x > 0
                                            then
                                                pictures [translate ((u+x)/2) y $ color col $ rectangleSolid (u-x) 10, mkTrace col ((u,v):z)]
                                            else
                                                pictures [translate ((x+u)/2) y $ color col $ rectangleSolid (x-u) 10, mkTrace col ((u,v):z)]
                                    else
                                        if v-y > 0
                                            then 
                                                pictures [translate x ((v+y)/2) $ color col $ rectangleSolid 10 (v-y), mkTrace col ((u,v):z)]
                                            else 
                                                pictures [translate x ((y+v)/2) $ color col $ rectangleSolid 10 (y-v), mkTrace col ((u,v):z)]
mkTrace _ _= pictures []

-- User Input
handleKeys :: Event -> TronGame -> TronGame
handleKeys (EventKey (Char 'r') _ _ _) game = Game {
        player1 = initialPoint1
    ,   player2 = initialPoint2
    ,   p1xVel = 10
    ,   p1yVel = 0
    ,   p2yVel = 10
    ,   p2xVel = 0
    ,   p1Trace = [initialPoint1]
    ,   p2Trace = [initialPoint2]
    }
handleKeys (EventKey (SpecialKey KeyUp) _ _ _) game = Game {
        player1 = player1 game
    ,   player2 = player2 game
    ,   p1xVel = 0
    ,   p1yVel = speed
    ,   p2yVel = p2yVel game
    ,   p2xVel = p2xVel game
    ,   p1Trace = (player1 game) : p1Trace game
    ,   p2Trace = (player2 game) : p2Trace game
    }
handleKeys (EventKey (SpecialKey KeyDown) _ _ _) game = Game {
        player1 = player1 game
    ,   player2 = player2 game
    ,   p1xVel = 0
    ,   p1yVel = -speed
    ,   p2yVel = p2yVel game
    ,   p2xVel = p2xVel game
    ,   p1Trace = (player1 game) : p1Trace game
    ,   p2Trace = (player2 game) : p2Trace game
    }
handleKeys (EventKey (SpecialKey KeyRight) _ _ _) game = Game {
        player1 = player1 game
    ,   player2 = player2 game
    ,   p1xVel = speed
    ,   p1yVel = 0
    ,   p2yVel = p2yVel game
    ,   p2xVel = p2xVel game
    ,   p1Trace = (player1 game) : p1Trace game
    ,   p2Trace = (player2 game) : p2Trace game
    }
handleKeys (EventKey (SpecialKey KeyLeft) _ _ _) game = Game {
        player1 = player1 game
    ,   player2 = player2 game
    ,   p1xVel = -speed
    ,   p1yVel = 0
    ,   p2yVel = p2yVel game
    ,   p2xVel = p2xVel game
    ,   p1Trace = (player1 game) : p1Trace game
    ,   p2Trace = (player2 game) : p2Trace game
    }
handleKeys (EventKey (Char 'w') _ _ _) game = Game {
        player1 = player1 game
    ,   player2 = player2 game
    ,   p1xVel = p1xVel game
    ,   p1yVel = p1yVel game
    ,   p2yVel = speed
    ,   p2xVel = 0
    ,   p1Trace = (player1 game) : p1Trace game
    ,   p2Trace = (player2 game) : p2Trace game
    }
handleKeys (EventKey (Char 's') _ _ _) game = Game {
        player1 = player1 game
    ,   player2 = player2 game
    ,   p1xVel = p1xVel game
    ,   p1yVel = p1yVel game
    ,   p2yVel = -speed
    ,   p2xVel = 0
    ,   p1Trace = (player1 game) : p1Trace game
    ,   p2Trace = (player2 game) : p2Trace game
    }
handleKeys (EventKey (Char 'a') _ _ _) game = Game {
        player1 = player1 game
    ,   player2 = player2 game
    ,   p1xVel = p1xVel game
    ,   p1yVel = p1yVel game
    ,   p2yVel = 0
    ,   p2xVel = -speed
    ,   p1Trace = (player1 game) : p1Trace game
    ,   p2Trace = (player2 game) : p2Trace game
    }
handleKeys (EventKey (Char 'd') _ _ _) game = Game {
        player1 = player1 game
    ,   player2 = player2 game
    ,   p1xVel = p1xVel game
    ,   p1yVel = p1yVel game
    ,   p2yVel = 0
    ,   p2xVel = speed
    ,   p1Trace = (player1 game) : p1Trace game
    ,   p2Trace = (player2 game) : p2Trace game
    }
handleKeys _ game = game


-- Events
wallCollision :: (Float, Float) -> (Float, Float) -> Bool 
wallCollision (objectx, objecty) (width, height) = topCollision || bottomCollision || leftCollision || rightCollision
  where
    topCollision    = objecty - (height/2) <= -150
    bottomCollision = objecty + ( height/2) >=  150
    leftCollision = objectx - ( width/2) <= -150
    rightCollision = objectx + ( width/2) >= 150

lineCollision :: [(Float, Float)] -> (Float, Float) -> Bool
lineCollision l a = elem a l

 
-- Animations functions
movePlayer :: Float -> TronGame -> TronGame
movePlayer sec game = Game {player1 = (p1NewX, p1NewY), player2 = (p2NewX, p2NewY), p1xVel=v1x, p1yVel=v1y, p2xVel=v2x, p2yVel = v2y, p1Trace=trailList1, p2Trace=trailList2}
        where
            (x, y) = player1 game
            (w, u) = player2 game
            v1x     = p1xVel game
            v2x     = p2xVel game
            v1y     = p1yVel game
            v2y     = p2yVel game
            p1NewX = x + v1x*sec
            p1NewY = y + v1y*sec
            p2NewX = w + v2x*sec
            p2NewY = u + v2y*sec
            trailList1 = p1Trace game 
            trailList2 = p2Trace game


teleport :: TronGame -> TronGame
teleport game = game { player1 = np1, player2 = np2 }
    where
        n@(p1x, p1y) = player1 game
        m@(p2x, p2y) = player2 game   
        np1 = if wallCollision n playerSize || lineCollision (p2Trace game) n
              then
                    (-10, 30)
               else
                    (n)
        np2 = if wallCollision m playerSize || lineCollision (p1Trace game) m
                then
                    (0, -3)
                else
                    (m)



------------------------------------------------------------

window :: Display
window = InWindow "Nice Window" (800, 800) (10, 10)

main :: IO ()
main = play window background fps initialState render handleKeys update

update :: Float -> TronGame -> TronGame 
update seconds = teleport . movePlayer seconds
