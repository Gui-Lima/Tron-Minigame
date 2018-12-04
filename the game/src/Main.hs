module Main(main) where
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

import Map

window :: Display
window = InWindow "TRoN" (150, 150) (10, 10)

main :: IO ()
main = display window (renderLine)

