{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Tls where

import C2HS
import Internal

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}


{#enum STATE_FLAGS as StateFlags {underscoreToCase} deriving (Show, Eq, Read) #}

data State_
{#pointer *STATE as State foreign -> State_ #}

instance Storable State_ where
    sizeOf _ = {#sizeof STATE #}
    alignment _ = {#alignof STATE #}
    peek _ = error "State_.peek: unsupported operation."
    poke _ _ = error "State_.poke: unsupported operation."

{#fun unsafe al_store_state as storeState { withMallocedForeign- `State' id, cFromEnumFlags `[StateFlags]' } -> `()' #}
{#fun unsafe al_restore_state as restoreState { withForeignPtr* `State' } -> `()' #}
