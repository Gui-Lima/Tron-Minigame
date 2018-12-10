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
        t1Control <- newMVar False
        t2Control <- newMVar False
        t3Control <- newMVar False
        playIO window background fps (initialState, t1Control, t2Control, t3Control) render handleKeys update

update :: Float -> (TronGame, (MVar Bool), (MVar Bool), (MVar Bool)) -> IO (TronGame, (MVar Bool), (MVar Bool), (MVar Bool)) 
update _ (game, t1Control, t2Control, t3Control) = do
                                                        x <- mapTeleport(endGame $ menuTeleport $ movePlayer game) t1Control t2Control t3Control
                                                        return (x, t1Control, t2Control, t3Control)
render :: (TronGame, (MVar Bool), (MVar Bool), (MVar Bool)) -> IO Picture
render (game, _,_,_) = return $ Pictures [getMap (tronMap game) mapCoords, writeWinner game, writeMenu game]
