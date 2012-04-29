{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.BitmapIO where

import C2HS
{#import Graphics.UI.Allegro.Raw.Bitmap #}
{#import Graphics.UI.Allegro.Raw.File #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

{#fun unsafe al_register_bitmap_loader as registerBitmapLoader { `String', id `FunPtr (Ptr CChar -> IO (Ptr Bitmap_))' } -> `Bool' #}
{#fun unsafe al_register_bitmap_saver as registerBitmapSaver { `String', id `FunPtr (Ptr CChar -> Ptr Bitmap_ -> IO CInt)' } -> `Bool' #}
{#fun unsafe al_register_bitmap_loader_f as registerBitmapLoaderF { `String', id `FunPtr (File -> IO (Ptr Bitmap_))' } -> `Bool' #}
{#fun unsafe al_register_bitmap_saver_f as registerBitmapSaverF { `String', id `FunPtr (File -> Ptr Bitmap_ -> IO CInt)' } -> `Bool' #}
{#fun unsafe al_load_bitmap as loadBitmap { `String' } -> `Maybe Bitmap' bitmapPtrToBitmap* #}
{#fun unsafe al_load_bitmap_f as loadBitmapF { id `File', `String' } -> `Maybe Bitmap' bitmapPtrToBitmap* #}
{#fun unsafe al_save_bitmap as saveBitmap { `String', withForeignPtr* `Bitmap' } -> `Bool' #}
{#fun unsafe al_save_bitmap_f as saveBitmapF { id `File', `String', withForeignPtr* `Bitmap' } -> `Bool' #}
