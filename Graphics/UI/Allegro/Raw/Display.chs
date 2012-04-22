{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Display where

import Control.Applicative
import C2HS
import Internal
{#import Graphics.UI.Allegro.Raw.Color #}
{#import Graphics.UI.Allegro.Raw.Bitmap #}
{#import Graphics.UI.Allegro.Raw.Events #}
{#import Graphics.UI.Allegro.Raw.DisplayData #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data DisplayFlags = Windowed
                  | Fullscreen
                  | OpenGL
                  | Direct3DInternal
                  | Resizable
                  | Noframe
                  | GenerateExposureEvents
                  | OpenGL3'0
                  | OpenGLForwardCompatible
                  | FullscreenWindow
                  | Minimized
                    deriving (Show, Eq, Ord, Read)

instance Bounded DisplayFlags where
    minBound = Windowed
    maxBound = Minimized

instance Enum DisplayFlags where
    toEnum 1     = Windowed
    toEnum 2     = Fullscreen
    toEnum 4     = OpenGL
    toEnum 8     = Direct3DInternal
    toEnum 0x10  = Resizable
    toEnum 0x20  = Noframe
    toEnum 0x40  = GenerateExposureEvents
    toEnum 0x80  = OpenGL3'0
    toEnum 0x100 = OpenGLForwardCompatible
    toEnum 0x200 = FullscreenWindow
    toEnum 0x400 = Minimized
    toEnum _     = error "DisplayFlags.toEnum: bad argument"
    fromEnum Windowed                = 1
    fromEnum Fullscreen              = 2
    fromEnum OpenGL                  = 4
    fromEnum Direct3DInternal        = 8
    fromEnum Resizable               = 0x10
    fromEnum Noframe                 = 0x20
    fromEnum GenerateExposureEvents  = 0x40
    fromEnum OpenGL3'0               = 0x80
    fromEnum OpenGLForwardCompatible = 0x100
    fromEnum FullscreenWindow        = 0x200
    fromEnum Minimized               = 0x400

    succ x = toEnum (fromEnum x * 2)
    pred x = toEnum (fromEnum x `div` 2)

    enumFrom     x   = enumFromTo x maxBound
    enumFromTo x y | x > y = []
                   | x == y = [y]
                   | otherwise = x : enumFromTo (succ x) y

data DisplayMode
    = DisplayMode { displayModeWidth, displayModeHeight :: Int
                  , displayModeFormat                   :: PixelFormat
                  , displayModeRefreshRate              :: Int
                  } deriving (Show, Eq, Ord, Read)
{#pointer *DISPLAY_MODE as DisplayModePtr -> DisplayMode #}

instance Storable DisplayMode where
    sizeOf _ = {#sizeof DISPLAY_MODE #}
    alignment _ = {#alignof DISPLAY_MODE #}
    peek p = DisplayMode <$> liftA fromIntegral ({#get DISPLAY_MODE->width #} p)
                         <*> liftA fromIntegral ({#get DISPLAY_MODE->height #} p)
                         <*> liftA cToEnum ({#get DISPLAY_MODE->format #} p)
                         <*> liftA fromIntegral ({#get DISPLAY_MODE->refresh_rate #} p)
    poke p DisplayMode {..} = do
        {#set DISPLAY_MODE->width #} p $ fromIntegral displayModeWidth
        {#set DISPLAY_MODE->height #} p $ fromIntegral displayModeHeight
        {#set DISPLAY_MODE->format #} p $ cFromEnum displayModeFormat
        {#set DISPLAY_MODE->refresh_rate #} p $ fromIntegral displayModeRefreshRate

data MonitorInfo = MonitorInfo { monitorInfoX1
                               , monitorInfoY1
                               , monitorInfoX2
                               , monitorInfoY2 :: Int
                               } deriving (Show, Eq, Ord, Read)
{#pointer *MONITOR_INFO as MonitorInfoPtr -> MonitorInfo #}

instance Storable MonitorInfo where
    sizeOf _ = {#sizeof MONITOR_INFO #}
    alignment _ = {#alignof MONITOR_INFO #}
    peek p = MonitorInfo <$> liftA fromIntegral ({#get MONITOR_INFO->x1 #} p)
                         <*> liftA fromIntegral ({#get MONITOR_INFO->y1 #} p)
                         <*> liftA fromIntegral ({#get MONITOR_INFO->x2 #} p)
                         <*> liftA fromIntegral ({#get MONITOR_INFO->y2 #} p)
    poke p MonitorInfo {..} = do
        {#set MONITOR_INFO->x1 #} p $ fromIntegral monitorInfoX1
        {#set MONITOR_INFO->y1 #} p $ fromIntegral monitorInfoY1
        {#set MONITOR_INFO->x2 #} p $ fromIntegral monitorInfoX2
        {#set MONITOR_INFO->y2 #} p $ fromIntegral monitorInfoY2


{#fun unsafe al_set_new_display_refresh_rate as setNewDisplayRefreshRate { `Int' } -> `()' #}
{#fun unsafe al_set_new_display_flags as setNewDisplayFlags { cFromEnumFlags `[DisplayFlags]' } -> `()' #}
{#fun unsafe al_get_new_display_refresh_rate as getNewDisplayRefreshRate { } -> `Int' #}
{#fun unsafe al_get_new_display_flags as getNewDisplayFlags { } -> `[DisplayFlags]' cToEnumFlags #}

{#fun unsafe al_get_display_width as getDisplayWidth { id `Display' } -> `Int' #}
{#fun unsafe al_get_display_height as getDisplayHeight { id `Display' } -> `Int' #}
{#fun unsafe al_get_display_format as getDisplayFormat { id `Display' } -> `PixelFormat' cToEnum #}
{#fun unsafe al_get_display_refresh_rate as getDisplayRefreshRate { id `Display' } -> `Int' #}
{#fun unsafe al_get_display_flags as getDisplayFlags { id `Display' } -> `[DisplayFlags]' cToEnumFlags #}
{#fun unsafe al_toggle_display_flag as toggleDisplayFlag { id `Display', cFromEnum `DisplayFlags', `Bool'} -> `Bool' #}

{#fun unsafe al_create_display as createDisplay { `Int', `Int' } -> `Display' id #}
{#fun unsafe al_destroy_display as destroyDisplay { id `Display' } -> `()' #}
{#fun unsafe al_get_current_display as getCurrentDisplay {  } -> `Display' id #}
{#fun unsafe al_set_target_bitmap as setTargetBitmap { id `Bitmap' } -> `()' #}
{#fun unsafe al_set_target_backbuffer as setTargetBackbuffer { id `Display' } -> `()' #}
{#fun unsafe al_get_backbuffer as getBackbuffer { id `Display' } -> `Bitmap' id #}
{#fun unsafe al_get_target_bitmap as getTargetBitmap { } -> `Bitmap' id #}

{#fun unsafe al_acknowledge_resize as acknowledgeResize { id `Display' } -> `Bool' #}
{#fun unsafe al_resize_display as resizeDisplay { id `Display', `Int', `Int' } -> `Bool' #}
{#fun unsafe al_flip_display as flipDisplay { } -> `()' #}
{#fun unsafe al_update_display_region as updateDisplayRegion { `Int', `Int', `Int', `Int' } -> `()' #}
{#fun unsafe al_is_compatible_bitmap as isCompatibleBitmap { id `Bitmap' } -> `Bool' #}

{#fun unsafe al_get_num_display_modes as getNumDisplayModes { } -> `Int' #}
{#fun unsafe al_get_display_mode as getDisplayMode { `Int', withT* `DisplayMode' } -> `DisplayMode' peek* #}
{#fun unsafe al_wait_for_vsync as waitForVsync { } -> `()' #}
{#fun unsafe al_get_display_event_source as getDisplayEventSource { id `Display' } -> `EventSource' id #}

{#fun unsafe al_clear_to_color_w as clearToColor { withT* `Color' } -> `()' #}
{#fun unsafe al_draw_pixel_w as drawPixel { `Float', `Float', withT* `Color' } -> `()' #}

{#fun unsafe al_set_display_icon as setDisplayIcon { id `Display', id `Bitmap' } -> `()' #}
{#fun unsafe al_get_num_video_adapters as getNumVideoAdapters {  } -> `Int' #}
{#fun unsafe al_get_monitor_info as getMonitorInfo { `Int', alloca- `MonitorInfo' peek* } -> `Bool' #}
{#fun unsafe al_get_new_display_adapter as getNewDisplayAdapter {  } -> `Int' #}
{#fun unsafe al_set_new_display_adapter as setNewDisplayAdapter { `Int' } -> `()' #}
{#fun unsafe al_set_new_window_position as setNewWindowPosition { `Int', `Int' } -> `()' #}
{#fun unsafe al_get_new_window_position as getNewWindowPosition { alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv* } -> `()' #}
{#fun unsafe al_set_window_position as setWindowPosition { id `Display', `Int', `Int' } -> `()' #}
{#fun unsafe al_get_window_position as getWindowPosition { id `Display', alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv* } -> `()' #}

{#fun unsafe al_set_window_title as setWindowTitle { id `Display', `String' } -> `()' #}

{#fun unsafe al_set_new_display_option as setNewDisplayOption { cFromEnum `DisplayOptions', `Int', `Int' } -> `()' #}
{#fun unsafe al_get_new_display_option as getNewDisplayOptions { cFromEnum `DisplayOptions', alloca- `Int' peekIntConv* } -> `Int' #}
{#fun unsafe al_reset_new_display_options as resetNewDisplayOptions { } -> `()' #}

{#fun unsafe al_get_display_option as getDisplayOption { id `Display', cFromEnum `DisplayOptions' } -> `Int' #}
{#fun unsafe al_hold_bitmap_drawing as holdBitmapDrawing { `Bool' } -> `()' #}
{#fun unsafe al_is_bitmap_drawing_held as isBitmapDrawingHeld { } -> `Bool' #}
