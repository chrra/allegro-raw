{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.JoystickData where

import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Joystick'
{#pointer *JOYSTICK as Joystick -> Joystick' #}

data JoystickState -- TODO
{#pointer *JOYSTICK_STATE as JoystickStatePtr -> JoystickState #}

instance Storable JoystickState where
    sizeOf _ = {#sizeof JOYSTICK_STATE #}
    alignment _ = {#alignof JOYSTICK_STATE #}
    peek _ = error "JoystickState.peek: TODO"
    poke _ _ = error "JoystickState.poke: TODO"
