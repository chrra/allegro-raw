{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.DisplayData where

import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Display'
{#pointer *DISPLAY as Display -> Display' #}

{#enum DISPLAY_OPTIONS as DisplayOptions {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
data Importance = Dontcare | Require | Suggest deriving (Show, Eq, Ord, Read, Bounded, Enum)
{#enum DISPLAY_ORIENTATION as DisplayOrientation {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
