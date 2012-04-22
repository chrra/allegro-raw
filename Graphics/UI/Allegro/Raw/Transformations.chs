{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Transformations where

import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Transform'
{#pointer *TRANSFORM as Transform -> Transform' #}

instance Storable Transform' where
    sizeOf _ = {#sizeof TRANSFORM #}
    alignment _ = {#alignof TRANSFORM #}
    peek _ = error "Transform'.peek: unsupported operation"
    poke _ _ = error "Transform'.poke: unsupported operation"

{#fun unsafe al_use_transform as useTransform { id `Transform' } -> `()' #}
{#fun unsafe al_copy_transform as copyTransform { id `Transform', id `Transform' } -> `()' #}
{#fun unsafe al_identity_transform as identityTransform { id `Transform' } -> `()' #}
{#fun unsafe al_build_transform as buildTransform { id `Transform', `Float', `Float', `Float', `Float', `Float' } -> `()' #}
{#fun unsafe al_translate_transform as translateTransform { id `Transform', `Float', `Float' } -> `()' #}
{#fun unsafe al_rotate_transform as rotateTransform { id `Transform', `Float' } -> `()' #}
{#fun unsafe al_scale_transform as scaleTransform { id `Transform', `Float', `Float' } -> `()' #}
{#fun unsafe al_transform_coordinates as transformCoordinates { id `Transform', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `()' #}
{#fun unsafe al_compose_transform as composeTransform { id `Transform', id `Transform' } -> `()' #}
{#fun unsafe al_get_current_transform as getCurrentTransform { } -> `Transform' id #}
{#fun unsafe al_invert_transform as invertTransform { id `Transform' } -> `()' #}
{#fun unsafe al_check_inverse as checkInverse { id `Transform', `Float' } -> `Int' #}
