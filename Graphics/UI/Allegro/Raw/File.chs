{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.File where

import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data File'
{#pointer *FILE as File -> File' #}
