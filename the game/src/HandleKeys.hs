module HandleKeys where
    import TronGame
    import Graphics.Gloss
    import Graphics.Gloss.Interface.Pure.Game


    handleKeys :: Event -> TronGame -> TronGame
    handleKeys _ game = game