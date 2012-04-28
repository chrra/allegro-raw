{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Addon.Image where

import Data.Word

import C2HS

#include "allegro-raw.h"

{#fun unsafe al_init_image_addon as initImageAddon { } -> `Bool' #}
{#fun unsafe al_shutdown_image_addon as shutdownImageAddon { } -> `()' #}
{#fun unsafe al_get_allegro_image_version as getAllegroImageVersion { } -> `Word32' #}

