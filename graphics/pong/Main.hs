module Main(main) where
import Graphics.Gloss

-- The game setup
data TronGame = Game    
    { player1 :: (Float, Float) -- Player 1 Location x y
    , player2 :: (Float, Float) -- Player 2 Location x y
    } deriving Show

initialState :: TronGame
initialState = Game
    {
        player1 = (-10,30)
    ,   player2 = (0, -3)
    }


render :: TronGame -> Picture
render game = pictures [
                        limits,
                        paddles
                        ]
    where
        paddles = pictures [mkPaddle rose (fst (player1 game))(snd(player1 game)),mkPaddle orange (fst (player2 game))(snd(player2 game))]
        limits = pictures [wall (greyN 0.5) 0 150, wall (greyN 0.5) 0 (-150), wall (greyN 0.5) 150 0, wall (greyN 0.5) (-150) 0]

   
-- Some parameters
paddleColor = light (light blue)
background = white
    
-- Factories
wall :: Color -> Float -> Float -> Picture
wall wallColor x y = translate x y $ color wallColor $ rectangleSolid 270 10

mkPaddle :: Color -> Float -> Float -> Picture
mkPaddle col x y = pictures
    [ translate x y $ color col $ rectangleSolid 26 86
    , translate x y $ color paddleColor $ rectangleSolid 20 80
    ]



-- 

window :: Display
window = InWindow "Nice Window" (800, 800) (10, 10)
     
main :: IO ()
main = display window background (render initialState)
