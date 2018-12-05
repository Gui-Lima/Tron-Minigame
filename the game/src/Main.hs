module Main(main) where
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Map
import Actions
import TronGame
import HandleKeys


fps = 30
background = white


window :: Display
window = InWindow "TRoN" (500, 500) (150, 150)

main :: IO ()
main = play window background fps initialState render handleKeys update

update :: Float -> TronGame -> TronGame 
update seconds game = movePlayer seconds game