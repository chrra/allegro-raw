{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Addon.Physfs where

import Data.Word

import C2HS

#include "allegro-raw.h"

{#fun unsafe al_set_physfs_file_interface as setPhysfsFileInterface { } -> `()' #}
{#fun unsafe al_get_allegro_physfs_version as getAllegroPhysfsVersion { } -> `Word32' #}

