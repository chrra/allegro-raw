{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Events where

import Control.Applicative
import C2HS
import Internal
import Graphics.UI.Allegro.Raw.Keycodes
{#import Graphics.UI.Allegro.Raw.MouseData #}
{#import Graphics.UI.Allegro.Raw.KeyboardData #}
{#import Graphics.UI.Allegro.Raw.TimerData #}
{#import Graphics.UI.Allegro.Raw.DisplayData #}
{#import Graphics.UI.Allegro.Raw.Altime #}
{#import Graphics.UI.Allegro.Raw.JoystickData #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

{#pointer *EVENT as EventPtr -> Event #}
{#pointer *USER_EVENT as UserEventPtr -> Event #}

data KeyboardEvent'
{#pointer *KEYBOARD_EVENT as KeyboardEvent -> KeyboardEvent' #}

data EventSource'
{#pointer *EVENT_SOURCE as EventSource -> EventSource' #}

data Event
    = JoystickAxis
      { eventJoystickSource :: Joystick
      , eventTimestamp :: Double
      , eventJoystickId :: Joystick
      , eventJoystickAxis :: Int
      , eventJoystickPos :: Float
      }
    | JoystickButtonDown
      { eventJoystickSource :: Joystick
      , eventTimestamp :: Double
      , eventJoystickId :: Joystick
      , eventJoystickButton :: Int
      }
    | JoystickButtonUp
      { eventJoystickSource :: Joystick
      , eventTimestamp :: Double
      , eventJoystickId :: Joystick
      , eventJoystickButton :: Int
      }
    | JoystickConfiguration
      { eventJoystickSource :: Joystick
      , eventTimestamp :: Double
      -- ??
      }
    | KeyDownEvent
      { eventKeyboardSource :: Keyboard
      , eventTimestamp :: Double
      , eventKeycode :: Key
      , eventDisplay :: Display
      }
    | KeyUpEvent
      { eventKeyboardSource :: Keyboard
      , eventTimestamp :: Double
      , eventKeycode :: Key
      , eventDisplay :: Display
      }
    | KeyChar
      { eventKeyboardSource :: Keyboard
      , eventTimestamp :: Double
      , eventKeycode :: Key
      , eventUnichar :: Char
      , eventKeyModifiers :: [Keymod]
      , eventKeyRepeat :: Bool
      , eventDisplay :: Display
      }
    | MouseAxes
      { eventMouseSource :: Mouse
      , eventTimestamp :: Double
      , eventMouseX :: Int
      , eventMouseY :: Int
      , eventMouseZ :: Int
      , eventMouseW :: Int
      , eventMouseDX :: Int
      , eventMouseDY :: Int
      , eventMouseDZ :: Int
      , eventMouseDW :: Int
      , eventDisplay :: Display
      }
    | MouseButtonDown
      { eventMouseSource :: Mouse
      , eventTimestamp :: Double
      , eventMouseX :: Int
      , eventMouseY :: Int
      , eventMouseZ :: Int
      , eventMouseW :: Int
      , eventMouseButton :: Int
      , eventDisplay :: Display
      }
    | MouseButtonUp
      { eventMouseSource :: Mouse
      , eventTimestamp :: Double
      , eventMouseX :: Int
      , eventMouseY :: Int
      , eventMouseZ :: Int
      , eventMouseW :: Int
      , eventMouseButton :: Int
      , eventDisplay :: Display
      }
    | MouseEnterDisplay
      { eventMouseSource :: Mouse
      , eventTimestamp :: Double
      , eventMouseX :: Int
      , eventMouseY :: Int
      , eventMouseZ :: Int
      , eventMouseW :: Int
      , eventDisplay :: Display
      }
    | MouseLeaveDisplay
      { eventMouseSource :: Mouse
      , eventTimestamp :: Double
      , eventMouseX :: Int
      , eventMouseY :: Int
      , eventMouseZ :: Int
      , eventMouseW :: Int
      , eventDisplay :: Display
      }
    | MouseWarped
      { eventMouseSource :: Mouse
      , eventTimestamp :: Double
      , eventMouseX :: Int
      , eventMouseY :: Int
      , eventMouseZ :: Int
      , eventMouseW :: Int
      , eventMouseDX :: Int
      , eventMouseDY :: Int
      , eventMouseDZ :: Int
      , eventMouseDW :: Int
      , eventDisplay :: Display
      }
    | Timer
      { eventTimestamp :: Double
      , eventTimerCount :: Word64
      , eventTimerSource :: Timer
      }
    | DisplayExpose
      { eventDisplaySource :: Display
      , eventTimestamp :: Double
      , eventDisplayX :: Int
      , eventDisplayY :: Int
      , eventDisplayWidth :: Int
      , eventDisplayHeight :: Int
      }
    | DisplayResize
      { eventDisplaySource :: Display
      , eventTimestamp :: Double
      , eventDisplayX :: Int
      , eventDisplayY :: Int
      , eventDisplayWidth :: Int
      , eventDisplayHeight :: Int
      }
    | DisplayClose
      { eventDisplaySource :: Display
      , eventTimestamp :: Double
      }
    | DisplayLost
      { eventDisplaySource :: Display
      , eventTimestamp :: Double
      }
    | DisplayFound
      { eventDisplaySource :: Display
      , eventTimestamp :: Double
      }
    | DisplaySwitchIn
      { eventDisplaySource :: Display
      , eventTimestamp :: Double
      }
    | DisplaySwitchOut
      { eventDisplaySource :: Display
      , eventTimestamp :: Double
      }
    | DisplayOrientation
      { eventDisplaySource :: Display
      , eventTimestamp :: Double
      , eventDisplayOrientation :: DisplayOrientation
      }
    | ReservedUserEvent
      { eventType :: Int
      , eventSource :: EventSource
      , eventTimestamp :: Double
      , eventData1 :: Ptr ()
      , eventData2 :: Ptr ()
      , eventData3 :: Ptr ()
      , eventData4 :: Ptr ()
      }
    | UserEvent
      { eventType :: Int
      , eventSource :: EventSource
      , eventTimestamp :: Double
      , eventData1 :: Ptr ()
      , eventData2 :: Ptr ()
      , eventData3 :: Ptr ()
      , eventData4 :: Ptr ()
      } deriving (Show, Eq, Ord)

instance Storable Event where
    sizeOf _ = {#sizeof EVENT #}
    alignment _ = {#alignof EVENT #}
    peek p = do
        typ <- {#get EVENT->type #} p
        eventTimestamp <- liftA realToFrac $ {#get EVENT->any.timestamp #} p
        case typ of
             _ | typ > 0 && typ < 10 -> do
                eventJoystickSource <- {#get EVENT->joystick.source #} p
                eventJoystickId <- {#get EVENT->joystick.id #} p
                eventJoystickAxis <- liftA fromIntegral $ {#get EVENT->joystick.stick #} p
                eventJoystickPos <- liftA realToFrac $ {#get EVENT->joystick.pos #} p
                eventJoystickButton <- liftA fromIntegral $ {#get EVENT->joystick.button #} p
                case typ of
                     1 -> return JoystickAxis {..}
                     2 -> return JoystickButtonDown {..}
                     3 -> return JoystickButtonUp {..}
                     4 -> return JoystickConfiguration {..}
                     _ -> error "Event.peek: unknown joystick event type"
             _ | typ >= 10 && typ < 20 -> do
                eventKeyboardSource <- {#get EVENT->keyboard.source #} p
                eventDisplay <- {#get EVENT.keyboard.display #} p
                eventKeycode <- liftA cToEnum $ {#get EVENT->keyboard.keycode #} p
                eventUnichar <- liftA cToEnum $ {#get EVENT->keyboard.unichar #} p
                eventKeyModifiers <- liftA cToEnumFlags $ {#get EVENT->keyboard.modifiers #} p
                eventKeyRepeat <- liftA toBool $ {#get EVENT->keyboard.repeat #} p
                case typ of
                     10 -> return KeyDownEvent {..}
                     11 -> return KeyChar {..}
                     12 -> return KeyUpEvent {..}
                     _  -> error "Event.peek: unknown keyboard event type"
             _ | typ >= 20 && typ < 30 -> do
                eventMouseSource <- {#get EVENT->mouse.source #} p
                eventDisplay <- {#get EVENT->mouse.display #} p
                eventMouseX <- liftA fromIntegral $ {#get EVENT->mouse.x #} p
                eventMouseY <- liftA fromIntegral $ {#get EVENT->mouse.y #} p
                eventMouseZ <- liftA fromIntegral $ {#get EVENT->mouse.z #} p
                eventMouseW <- liftA fromIntegral $ {#get EVENT->mouse.w #} p
                eventMouseDX <- liftA fromIntegral $ {#get EVENT->mouse.dx #} p
                eventMouseDY <- liftA fromIntegral $ {#get EVENT->mouse.dy #} p
                eventMouseDZ <- liftA fromIntegral $ {#get EVENT->mouse.dz #} p
                eventMouseDW <- liftA fromIntegral $ {#get EVENT->mouse.dw #} p
                eventMouseButton <- liftA fromIntegral $ {#get EVENT->mouse.button #} p
                -- pressure?
                return $
                  case typ of
                       20 -> MouseAxes {..}
                       21 -> MouseButtonDown {..}
                       22 -> MouseButtonUp {..}
                       23 -> MouseEnterDisplay {..}
                       24 -> MouseLeaveDisplay {..}
                       25 -> MouseWarped {..}
                       _  -> error "Event.peek: unknown mouse event type"
             _ | typ >= 30 && typ < 40 -> do
                eventTimerSource <- {#get EVENT->timer.source #} p
                eventTimerCount <- liftA fromIntegral $ {#get EVENT->timer.count #} p
                case typ of
                     30 -> return Timer {..}
                     _  -> error "Event.peek: unknown timer event type"
             _ | typ >= 40 && typ < 50 -> do
                eventDisplaySource <- {#get EVENT->display.source #} p
                eventDisplayX <- liftA fromIntegral $ {#get EVENT->display.x #} p
                eventDisplayY <- liftA fromIntegral $ {#get EVENT->display.y #} p
                eventDisplayWidth <- liftA fromIntegral $ {#get EVENT->display.width #} p
                eventDisplayHeight <- liftA fromIntegral $ {#get EVENT->display.height #} p
                eventDisplayOrientation <- liftA cToEnum $ {#get EVENT->display.orientation #} p
                return $
                  case typ of
                       40 -> DisplayExpose {..}
                       41 -> DisplayResize {..}
                       42 -> DisplayClose {..}
                       43 -> DisplayLost {..}
                       44 -> DisplayFound {..}
                       45 -> DisplaySwitchIn {..}
                       46 -> DisplaySwitchOut {..}
                       47 -> DisplayOrientation {..}
                       _  -> error "Event.peek: unknown display event type"
             _ | typ < 512 -> error "Event.peek: unknown builtin event type"
             _ -> do
                let eventType = fromIntegral typ
                eventSource <- {#get EVENT->any.source #} p
                eventData1 <- {#get EVENT->user.data1 #} p
                eventData2 <- {#get EVENT->user.data2 #} p
                eventData3 <- {#get EVENT->user.data3 #} p
                eventData4 <- {#get EVENT->user.data4 #} p
                return $ if typ < 1024 then ReservedUserEvent {..}
                                       else UserEvent {..}
    poke _ _ = error "Event.poke: TODO"

{#fun unsafe al_init_user_event_source as initUserEventSource { id `EventSource' } -> `()' #}
{#fun unsafe al_destroy_user_event_source as destroyUserEventSource { id `EventSource' } -> `()' #}
{#fun unsafe al_emit_user_event as emitUserEvent { id `EventSource', withT* `Event' , id `FunPtr (UserEventPtr -> IO ())' } -> `Bool' #}
{#fun unsafe al_unref_user_event as unrefUserEvent { id `UserEventPtr' } -> `()' #}
{#fun unsafe al_set_event_source_data as setEventSourceData { id `EventSource', id `Ptr ()' } -> `()' #}
{#fun unsafe al_get_event_source_data as getEventSourceData { id `EventSource' } -> `Ptr ()' id #}

data EventQueue'
{#pointer *EVENT_QUEUE as EventQueue -> EventQueue' #}

{#fun unsafe al_create_event_queue as createEventQueue {  } -> `EventQueue' id #}
{#fun unsafe al_destroy_event_queue as destroyEventQueue { id `EventQueue' } -> `()' #}
{#fun unsafe al_register_event_source as registerEventSource { id `EventQueue', id `EventSource' } -> `()' #}
{#fun unsafe al_unregister_event_source as unregisterEventSource { id `EventQueue', id `EventSource' } -> `()' #}
{#fun unsafe al_is_event_queue_empty as isEventQueueEmpty { id `EventQueue' } -> `Bool' #}
{#fun unsafe al_get_next_event as getNextEvent' { id `EventQueue', withMalloc- `EventPtr' id } -> `Bool' #}
getNextEvent :: EventQueue -> IO (Maybe Event)
getNextEvent = ptrAndBoolToMaybe . getNextEvent'

{#fun unsafe al_peek_next_event as peekNextEvent' { id `EventQueue', withMalloc- `EventPtr' id } -> `Bool' #}
peekNextEvent :: EventQueue -> IO (Maybe Event)
peekNextEvent = ptrAndBoolToMaybe . peekNextEvent'

{#fun unsafe al_drop_next_event as dropNextEvent' { id `EventQueue' } -> `Bool' #}
{#fun unsafe al_flush_event_queue as flushEventQueue { id `EventQueue' } -> `()' #}
{#fun unsafe al_wait_for_event as waitForEvent { id `EventQueue', alloca- `Event' peek* } -> `()' #}
{#fun unsafe al_wait_for_event_timed as waitForEventTimed' { id `EventQueue', alloca- `EventPtr' id, `Float' } -> `Bool' #}
waitForEventTimed :: EventQueue -> Float -> IO (Maybe Event)
waitForEventTimed = (ptrAndBoolToMaybe .) . waitForEventTimed'
{#fun unsafe al_wait_for_event_until as waitForEventUntil' { id `EventQueue', withMalloc- `EventPtr' id, id `Timeout' } -> `Bool' #}
waitForEventUntil :: EventQueue -> Timeout -> IO (Maybe Event)
waitForEventUntil = (ptrAndBoolToMaybe .) . waitForEventUntil'
