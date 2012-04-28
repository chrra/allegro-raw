{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Utf8 where

import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Ustr_
{#pointer *USTR as Ustr foreign -> Ustr_ #}

foreign import ccall "allegro-raw.h &al_ustr_free"
    destroyUstrPtr :: FinalizerPtr Ustr_

ustrPtrToUstr :: Ptr Ustr_ -> IO Ustr
ustrPtrToUstr = newForeignPtr destroyUstrPtr

{#fun unsafe al_ustr_new as ustrNew { `String' } -> `Ustr' ustrPtrToUstr* #}
{#fun unsafe al_ustr_new_from_buffer as ustrNewFromBuffer { `String'& } -> `Ustr' ustrPtrToUstr* #}

-- Todo?
