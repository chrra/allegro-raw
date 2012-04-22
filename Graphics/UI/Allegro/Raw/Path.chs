{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Path where

import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Path'
{#pointer *PATH as Path -> Path' #}
