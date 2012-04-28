{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Addon.Acodec where

import Data.Word

import C2HS

#include "allegro-raw.h"

{#fun unsafe al_init_acodec_addon as initAcodecAddon { } -> `()' #}
{#fun unsafe al_get_allegro_acodec_version as getAllegroAcodecVersion { } -> `Word32' #}
