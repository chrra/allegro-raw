{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.TimerData where

import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Timer'
{#pointer *TIMER as Timer -> Timer' #}
