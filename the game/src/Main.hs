module Main(main) where
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Interface.IO.Game
import MapFunctions
import Actions
import TronGame
import HandleKeys
import Data
import Images
import Map

fps = 30
background = white


window :: Display
window = InWindow "TRoN" (1280, 720) (10, 10)

main :: IO ()
main = playIO window background fps initialState render handleKeys update

update :: Float -> TronGame -> IO TronGame 
update _ game = return $ endGame $ menuTeleport $ movePlayer game

render :: TronGame -> IO Picture
render game = return $ Pictures [getMap (scoreMap game) barrinaMapCoord, getMap (tronMap game) mapCoords, writeWinner game, writeMenu game]

