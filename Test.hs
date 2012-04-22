
import Graphics.UI.Allegro.Raw

main = do
    initialize
    display <- createDisplay 640 480
    dispBit <- getBackbuffer display
    setTargetBitmap dispBit
    clearToColor (Color 1 1 1 1)
    flipDisplay
    installKeyboard
    q <- createEventQueue
    dispsrc <- getDisplayEventSource display
    keysrc <- getKeyboardEventSource
    registerEventSource q dispsrc
    registerEventSource q keysrc
    loop q

loop q = do
    ev <- waitForEvent q
    print ev
    case ev of
         DisplayClose {} -> putStrLn "Baibai."
         _ -> loop q
