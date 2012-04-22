{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.DisplayData where

import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Display'
{#pointer *DISPLAY as Display -> Display' #}

{#enum DISPLAY_OPTIONS as DisplayOptions {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
-- ALLEGRO_DONTCARE & friends are what?
{#enum DISPLAY_ORIENTATION as DisplayOrientation {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
