{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE RecordWildCards #-}
module Graphics.UI.Allegro.Raw.Color where

import Control.Applicative
import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Color = Color { colorR, colorG, colorB, colorA :: Float }

{#pointer *COLOR as ColorPtr -> Color #}

instance Storable Color where
    sizeOf _ = {#sizeof COLOR #}
    alignment _ = {#alignof COLOR #}
    peek p = Color <$> liftA realToFrac ({#get COLOR->r #} p)
                   <*> liftA realToFrac ({#get COLOR->g #} p)
                   <*> liftA realToFrac ({#get COLOR->b #} p)
                   <*> liftA realToFrac ({#get COLOR->a #} p)
    poke p Color {..} = do {#set COLOR->r #} p $ realToFrac colorR
                           {#set COLOR->g #} p $ realToFrac colorG
                           {#set COLOR->b #} p $ realToFrac colorB
                           {#set COLOR->a #} p $ realToFrac colorA
