module Main(main) where
import Graphics.Gloss
import Graphics.Gloss.Data.ViewPort

-- The game setup
data TronGame = Game    
    { player1 :: (Float, Float) -- Player 1 Location x y
    , player2 :: (Float, Float) -- Player 2 Location x y
    , p1Vel :: (Float)
    , p2Vel :: (Float)
    , p1Trace :: [(Float, Float)]
    , p2Trace ::[(Float, Float)]
    } deriving Show

initialState :: TronGame
initialState = Game
    {
        player1 = (-10,30)
    ,   player2 = (0, -3)
    ,   p1Vel = 5
    ,   p2Vel = 5
    ,   p1Trace = []
    ,   p2Trace = []
    }


render :: TronGame -> Picture
render game = pictures [
                        limits,
                        paddles,
                        traces
                        ]
    where
        paddles = pictures [mkPaddle rose (fst (player1 game))(snd(player1 game)),mkPaddle orange (fst (player2 game))(snd(player2 game))]
        limits = pictures [wall (greyN 0.5) 0 150, wall (greyN 0.5) 0 (-150), wall (greyN 0.5) 150 0, wall (greyN 0.5) (-150) 0]
        traces = pictures [mkTrace rose (p1Trace game), mkTrace orange (p2Trace game)]
   
-- Some parameters
paddleColor = light (light blue)
background = white
fps = 60
    
-- Factories
wall :: Color -> Float -> Float -> Picture
wall wallColor x y = translate x y $ color wallColor $ rectangleSolid 270 10

mkPaddle :: Color -> Float -> Float -> Picture
mkPaddle col x y = pictures
    [ translate x y $ color col $ rectangleSolid 26 86
    , translate x y $ color paddleColor $ rectangleSolid 20 80
    ]

mkTrace :: Color -> [(Float, Float)] -> Picture
mkTrace _ [] = pictures []
mkTrace col n@((x,y):z) = pictures [translate x y $ color col $ rectangleSolid 26 86, mkTrace col z]

-- Animations functions

movePlayer :: Float -> TronGame -> TronGame
movePlayer sec game = Game {player1 = (p1NewX, p1NewY), player2 = (p2NewX, p2NewY), p1Vel=v1, p2Vel=v2, p1Trace=p1Tail, p2Trace=p2Tail}
        where
            (x, y) = player1 game
            (w, u) = player2 game
            v1     = p1Vel game
            v2     = p2Vel game
            p1NewX = x + v1*sec
            p1NewY = y + v1*sec
            p2NewX = w + v2*sec
            p2NewY = u + v2*sec
            trailList1 = p1Trace game
            p1Tail = trailList1 ++ [(x, y)]
            trailList2 = p2Trace game
            p2Tail = trailList2 ++ [(w, u)]

------------------------------------------------------------

window :: Display
window = InWindow "Nice Window" (800, 800) (10, 10)
     
main :: IO ()
main = simulate window background fps initialState render update

update :: ViewPort -> Float -> TronGame -> TronGame 
update _ = movePlayer