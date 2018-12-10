module Utility where


    makeRandom :: (Int, Int) -> (Int, Int)
    makeRandom (x,y)
                    | x < 17 && y > 40 = (mod x 3, mod y 17)
                    | x >= 57 || y < 3 = ( mod (mod x 97) 45, mod (y+1231) 45)
                    | otherwise = (mod (x*234+2312) 45, mod (y*23+232) 45)