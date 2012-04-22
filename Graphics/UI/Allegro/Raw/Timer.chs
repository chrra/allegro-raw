{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Timer
    ( module Graphics.UI.Allegro.Raw.Timer
    , module Graphics.UI.Allegro.Raw.TimerData
    ) where

import Data.Int

import C2HS

{#import Graphics.UI.Allegro.Raw.TimerData #}
{#import Graphics.UI.Allegro.Raw.Events #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

{#fun unsafe al_create_timer as createTimer { `Double' } -> `Timer' id #}
{#fun unsafe al_destroy_timer as destroyTimer { id `Timer' } -> `()' #}
{#fun unsafe al_start_timer as startTimer { id `Timer' } -> `()' #}
{#fun unsafe al_stop_timer as stopTimer { id `Timer' } -> `()' #}
{#fun unsafe al_get_timer_started as getTimerStarted { id `Timer' } -> `()' #}
{#fun unsafe al_get_timer_speed as getTimerSpeed { id `Timer' } -> `Double' #}
{#fun unsafe al_set_timer_speed as setTimerSpeed { id `Timer', `Double' } -> `()' #}
{#fun unsafe al_get_timer_count as getTimerCount { id `Timer' } -> `Int64' #}
{#fun unsafe al_set_timer_count as setTimerCount { id `Timer', `Int64' } -> `()' #}
{#fun unsafe al_add_timer_count as addTimerCount { id `Timer', `Int64' } -> `()' #}
{#fun unsafe al_get_timer_event_source as getTimerEventSource { id `Timer' } -> `EventSource' id #}
