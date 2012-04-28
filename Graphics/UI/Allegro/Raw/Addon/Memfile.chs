{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Addon.Memfile where

import Data.Int
import Data.Word

import C2HS
{#import Graphics.UI.Allegro.Raw.File #}

#include "allegro-raw.h"

{#fun unsafe al_open_memfile as openMemfile { id `Ptr ()', `Int64', `String' } -> `File' id #}
{#fun unsafe al_get_allegro_memfile_version as getAllegroMemfileVersion { } -> `Word32' #}
