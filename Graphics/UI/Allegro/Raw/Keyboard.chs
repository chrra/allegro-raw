{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Keyboard where

import C2HS
import Internal

import Graphics.UI.Allegro.Raw.Keycodes
{#import Graphics.UI.Allegro.Raw.KeyboardData #}
{#import Graphics.UI.Allegro.Raw.Events #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

{#fun unsafe al_is_keyboard_installed as isKeyboardInstalled { } -> `Bool' #}
{#fun unsafe al_install_keyboard as installKeyboard { } -> `Bool' #}
{#fun unsafe al_uninstall_keyboard as uninstallKeyboard { } -> `()' #}
{#fun unsafe al_set_keyboard_leds as setKeyboardLeds { `Int' } -> `Bool' #}
{#fun unsafe al_keycode_to_name as keycodeToName { cFromEnum `Key' } -> `String' #}
{#fun unsafe al_get_keyboard_state as getKeyboardState { alloca- `KeyboardState' peek* } -> `()' #}
{#fun unsafe al_key_down as keyDown { withT* `KeyboardState', cFromEnum `Key' } -> `Bool' #}
{#fun unsafe al_get_keyboard_event_source as getKeyboardEventSource { } -> `EventSource' id #}
