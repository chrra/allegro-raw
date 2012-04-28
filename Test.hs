
import Graphics.UI.Allegro.Raw

main = do
    initialize
    initPrimitivesAddon
    display <- createDisplay 640 480
    dispBit <- getBackbuffer display
    setTargetBitmap dispBit
    clearToColor (Color 1 1 1 1)
    drawFilledRectangle 50 50 500 400 (Color 0 0 1 0.5)
    drawFilledRectangle 150 150 400 300 (Color 0 0 1 0.5)
    drawCircle 275 225 175 (Color 1 0 0 1) 5
    drawFilledTriangle  275                (225-200)
                       (275-cos(pi/4)*200) (225+sin(pi/4)*200)
                       (275+cos(pi/4)*200) (225+sin(pi/4)*200)
                       (Color 1 0 1 0.5)
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
