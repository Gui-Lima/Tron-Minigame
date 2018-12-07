module Images where
    import Graphics.Gloss
    import Graphics.Gloss.Interface.Pure.Game
    import Map
    import TronGame


    writeWinner :: TronGame -> Picture
    writeWinner game = if draw 
                            then    
                                translate (-250) 150 $ text "Draw!"
                        else
                            if overp1Won
                                then 
                                    translate (-250) 150 $ text "P1 WINS!"
                            else
                                if overp2Won
                                    then
                                        translate (-250) 150 $ text "P2 WINS!"
                                else
                                        Pictures []
                where           
                    overp1Won = gameIsOver game == 1
                    overp2Won = gameIsOver game == 2
                    draw      = gameIsOver game == 3

    
    writeMenu :: TronGame -> Picture
    writeMenu game = if mapId game == 0
                        then
                            Pictures [translate 100 200 $ text "simple", translate 100 0 $ text "obstacle", translate 100 (-200) $ text "teleport"]
                        else
                            Pictures []  