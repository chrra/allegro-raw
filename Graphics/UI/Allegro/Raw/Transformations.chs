{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Transformations where

import C2HS
import Internal

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Transform'
{#pointer *TRANSFORM as Transform foreign -> Transform' #}

instance Storable Transform' where
    sizeOf _ = {#sizeof TRANSFORM #}
    alignment _ = {#alignof TRANSFORM #}
    peek _ = error "Transform'.peek: unsupported operation"
    poke _ _ = error "Transform'.poke: unsupported operation"

-- Copies the data into the target bitmap, safe to finalize.
{#fun unsafe al_use_transform as useTransform { withForeignPtr* `Transform' } -> `()' #}
{#fun unsafe al_copy_transform as copyTransform { withMallocedForeign- `Transform' id, withForeignPtr* `Transform' } -> `()' #}
{#fun unsafe al_identity_transform as identityTransform { withForeignPtr* `Transform' } -> `()' #}
{#fun unsafe al_identity_transform as newIdentityTransform { withMallocedForeign- `Transform' id } -> `()' #}
{#fun unsafe al_build_transform as buildTransform { withMallocedForeign- `Transform' id, `Float', `Float', `Float', `Float', `Float' } -> `()' #}
{#fun unsafe al_translate_transform as translateTransform { withForeignPtr* `Transform', `Float', `Float' } -> `()' #}
{#fun unsafe al_rotate_transform as rotateTransform { withForeignPtr* `Transform', `Float' } -> `()' #}
{#fun unsafe al_scale_transform as scaleTransform { withForeignPtr* `Transform', `Float', `Float' } -> `()' #}
{#fun unsafe al_transform_coordinates as transformCoordinates { withForeignPtr* `Transform', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `()' #}
{#fun unsafe al_compose_transform as composeTransform { withForeignPtr* `Transform', withForeignPtr* `Transform' } -> `()' #}
-- return = al_get_target_bitmap()->transform, don't free:
{#fun unsafe al_get_current_transform as getCurrentTransform { } -> `Maybe Transform' maybeNewForeignPtr_* #}
{#fun unsafe al_invert_transform as invertTransform { withForeignPtr* `Transform' } -> `()' #}
{#fun unsafe al_check_inverse as checkInverse { withForeignPtr* `Transform', `Float' } -> `Bool' #}
