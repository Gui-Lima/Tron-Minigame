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
import Control.Concurrent


fps = 30
background = white


window :: Display
window = InWindow "TRoN" (1280, 720) (10, 10)

main = do 
        p1Control <- newMVar initialSpeed
        playIO window background fps (initialState, p1Control) render handleKeys update

update :: Float -> (TronGame, (MVar Int)) -> IO (TronGame, (MVar Int)) 
update _ (game, p1Control) = return (endGame $ menuTeleport $ movePlayer game, p1Control)

render :: (TronGame, (MVar Int)) -> IO Picture
render (game, _) = return $ Pictures [getMap (tronMap game) mapCoords, writeWinner game, writeMenu game]

