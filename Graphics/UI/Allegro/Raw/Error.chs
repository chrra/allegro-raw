{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Error where

import C2HS

#include "allegro-raw.h"

{#fun unsafe al_get_errno as getErrno { } -> `Int' #}
{#fun unsafe al_set_errno as setErrno { `Int' } -> `()' #}
