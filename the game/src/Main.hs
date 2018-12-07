module Main(main) where
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import MapFunctions
import Actions
import TronGame
import HandleKeys
import Data

fps = 30
background = white


window :: Display
window = InWindow "TRoN" (1280, 720) (10, 10)

main :: IO ()
main = play window background fps initialState render handleKeys update

update :: Float -> TronGame -> TronGame 
update _ game = menuTeleport $ movePlayer game