{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Mouse where

import C2HS
import Internal
{#import Graphics.UI.Allegro.Raw.MouseData #}
{#import Graphics.UI.Allegro.Raw.Bitmap #}
{#import Graphics.UI.Allegro.Raw.DisplayData #}
{#import Graphics.UI.Allegro.Raw.Events #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

{#fun unsafe al_is_mouse_installed as isMouseInstalled { } -> `Bool' #}
{#fun unsafe al_install_mouse as installMouse { } -> `Bool' #}
{#fun unsafe al_uninstall_mouse as uninstallMouse { } -> `()' #}
{#fun unsafe al_get_mouse_num_buttons as getMouseNumButtons { } -> `Int' #}
{#fun unsafe al_get_mouse_num_axes as getMouseNumAxes { } -> `Int' #}
{#fun unsafe al_set_mouse_xy as setMouseXy { id `Display', `Int', `Int' } -> `Bool' #}
{#fun unsafe al_set_mouse_z as setMouseZ { `Int' } -> `Bool' #}
{#fun unsafe al_set_mouse_w as setMouseW { `Int' } -> `Bool' #}
{#fun unsafe al_set_mouse_axis as setMouseAxis { `Int', `Int' } -> `Bool' #}
{#fun unsafe al_get_mouse_state as getMouseState { alloca- `MouseState' peek* } -> `()' #}
{#fun unsafe al_mouse_button_down as mouseButton { id `MouseStatePtr', `Int' } -> `Bool' #}
{#fun unsafe al_get_mouse_state_axis as getMouseStateAxis { id `MouseStatePtr', `Int' } -> `Int' #}

{#fun unsafe al_get_mouse_event_source as getMouseEventSource { } -> `EventSource' id #}

{#fun unsafe al_create_mouse_cursor as createMouseCursor { id `Bitmap', `Int', `Int' } -> `MouseCursor' id #}
{#fun unsafe al_destroy_mouse_cursor as destroyMouseCursor { id `MouseCursor' } -> `()' #}
{#fun unsafe al_set_mouse_cursor as setMouseCursor { id `Display', id `MouseCursor' } -> `Bool' #}
{#fun unsafe al_set_system_mouse_cursor as setSystemMouseCursor { id `Display', cFromEnum `SystemMouseCursor' } -> `Bool' #}
{#fun unsafe al_show_mouse_cursor as showMouseCursor { id `Display' } -> `Bool' #}
{#fun unsafe al_hide_mouse_cursor as hideMouseCursor { id `Display' } -> `Bool' #}
{#fun unsafe al_get_mouse_cursor_position as getMouseCursorPosition { alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv* } -> `Bool' #}
{#fun unsafe al_grab_mouse as grabMouse { id `Display' } -> `Bool' #}
{#fun unsafe al_ungrab_mouse as ungrabMouse { } -> `()' #}
