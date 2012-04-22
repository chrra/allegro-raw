{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Joystick where

import C2HS
{#import Graphics.UI.Allegro.Raw.JoystickData #}
{#import Graphics.UI.Allegro.Raw.Events #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

{#enum JOYFLAGS as Joyflags {underscoreToCase} deriving (Show, Eq, Ord, Read) #}

{#fun unsafe al_install_joystick as installJoystick { } -> `Bool' #}
{#fun unsafe al_uninstall_joystick as uninstallJoystick { } -> `()' #}
{#fun unsafe al_is_joystick_installed as isJoystickInstalled { } -> `Bool' #}
{#fun unsafe al_reconfigure_joysticks as reconfigureJoysticks {  } -> `Bool' #}
{#fun unsafe al_get_num_joysticks as getNumJoysticks { } -> `Int' #}
{#fun unsafe al_get_joystick as getJoystick { `Int' } -> `Joystick' id #}
{#fun unsafe al_release_joystick as releaseJoystick { id `Joystick' } -> `()' #}
{#fun unsafe al_get_joystick_active as getJoystickActive { id `Joystick' } -> `Bool' #}
{#fun unsafe al_get_joystick_name as getJoystickName { id `Joystick' } -> `String' #}
{#fun unsafe al_get_joystick_num_sticks as getJoystickNumSticks { id `Joystick' } -> `Int' #}
{#fun unsafe al_get_joystick_stick_flags as getJoystickStickFlags { id `Joystick', `Int' } -> `Int' #}
{#fun unsafe al_get_joystick_stick_name as getJoystickStickName { id `Joystick', `Int' } -> `String' #}
{#fun unsafe al_get_joystick_num_axes as getJoystickNumAxes { id `Joystick', `Int' } -> `Int' #}
{#fun unsafe al_get_joystick_axis_name as getJoystickAxisName { id `Joystick', `Int', `Int' } -> `String' #}
{#fun unsafe al_get_joystick_num_buttons as getJoystickNumButtons { id `Joystick' } -> `Int' #}
{#fun unsafe al_get_joystick_button_name as getJoystickButtonName { id `Joystick', `Int' } -> `String' #}
{#fun unsafe al_get_joystick_state as getJoystickState { id `Joystick', alloca- `JoystickStatePtr' id } -> `()' #}
{#fun unsafe al_get_joystick_event_source as getJoystickEventSource { } -> `EventSource' id #}
