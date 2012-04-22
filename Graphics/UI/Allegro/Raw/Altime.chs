{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Altime where

import C2HS
import Internal

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Timeout'
{#pointer *TIMEOUT as Timeout -> Timeout' #}

instance Storable Timeout' where
    sizeOf _ = {#sizeof TIMEOUT #}
    alignment _ = {#alignof TIMEOUT #}
    peek _ = error "Timeout'.peek: unsupported operation"
    poke _ _ = error "Timeout'.poke: unsupported operation"

{#fun unsafe al_get_time as getTime { } -> `Double' #}
{#fun unsafe al_rest as rest { `Double' } -> `()' #}
{#fun unsafe al_init_timeout as initTimeout { withMalloc- `Timeout' id, `Double' } -> `()' #}
