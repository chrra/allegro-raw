{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.MouseData where

import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Mouse'
{#pointer *MOUSE as Mouse -> Mouse' #}

data MouseState -- TODO
{#pointer *MOUSE_STATE as MouseStatePtr -> MouseState #}

instance Storable MouseState where
    sizeOf _ = {#sizeof MOUSE_STATE #}
    alignment _ = {#alignof MOUSE_STATE #}
    peek _ = error "MouseState.peek: TODO"
    poke _ _ = error "MouseState.poke: TODO"

data MouseCursor'
{#pointer *MOUSE_CURSOR as MouseCursor -> MouseCursor' #}

{#enum SYSTEM_MOUSE_CURSOR as SystemMouseCursor {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
