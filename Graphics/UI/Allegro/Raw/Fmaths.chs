{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Fmaths where

import C2HS

#include "allegro-raw.h"

{#fun pure unsafe al_fixsqrt as fixsqrt { `Int' } -> `Int' #}
{#fun pure unsafe al_fixhypot as fixhypot { `Int', `Int' } -> `Int' #}
{#fun pure unsafe al_fixatan as fixatan { `Int' } -> `Int' #}
{#fun pure unsafe al_fixatan2 as fixatan2 { `Int', `Int' } -> `Int' #}
