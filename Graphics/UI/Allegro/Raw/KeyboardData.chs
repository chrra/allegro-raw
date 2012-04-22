{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.KeyboardData where

import Control.Applicative

import C2HS
{#import Graphics.UI.Allegro.Raw.DisplayData #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Keyboard'
{#pointer *KEYBOARD as Keyboard -> Keyboard' #}

data KeyboardState = KeyboardState { keyboardStateDisplay :: Display }
{#pointer *KEYBOARD_STATE as KeyboardStatePtr -> KeyboardState #}

instance Storable KeyboardState where
    sizeOf _ = {#sizeof KEYBOARD_STATE #}
    alignment _ = {#alignof KEYBOARD_STATE #}
    peek p = KeyboardState <$> {#get KEYBOARD_STATE->display #} p
    poke p (KeyboardState x) = {#set KEYBOARD_STATE->display #} p x
