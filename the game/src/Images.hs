module Images where
    import Graphics.Gloss
    import Graphics.Gloss.Interface.Pure.Game
    import Map
    import TronGame


    writeWinner :: TronGame -> Picture
    writeWinner game = if p1Death 
                            then 
                                translate (-250) 150 $ text "P2 WINS!"
                            else
                                if p2Death
                                    then 
                                        translate (-250) 150 $ text "P1 WINS!"
                                    else
                                        Pictures[]
                where
                    p1Death = p1dead game
                    p2Death = p2dead game

    
    writeMenu :: TronGame -> Picture
    writeMenu game = if mapId game == 0
                        then
                            Pictures [translate (-500) 0 $ text "Go through a wall to play that map" , translate 100 200 $ text "simple", translate 100 0 $ text "obstacle", translate 100 (-200) $ text "teleport"]
                        else
                            Pictures []  