{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.BitmapIO where

import C2HS
{#import Graphics.UI.Allegro.Raw.Bitmap #}
{#import Graphics.UI.Allegro.Raw.File #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

{#fun unsafe al_register_bitmap_loader as registerBitmapLoader { `String', id `FunPtr (Ptr CChar -> IO Bitmap)' } -> `Int' #}
{#fun unsafe al_register_bitmap_saver as registerBitmapSaver { `String', id `FunPtr (Ptr CChar -> Bitmap -> IO CInt)' } -> `Int' #}
{#fun unsafe al_register_bitmap_loader_f as registerBitmapLoaderF { `String', id `FunPtr (File -> IO Bitmap)' } -> `Int' #}
{#fun unsafe al_register_bitmap_saver_f as registerBitmapSaverF { `String', id `FunPtr (File -> Bitmap -> IO CInt)' } -> `Int' #}
{#fun unsafe al_load_bitmap as loadBitmap { `String' } -> `Bitmap' id #}
{#fun unsafe al_load_bitmap_f as loadBitmapF { id `File', `String' } -> `Bitmap' id #}
{#fun unsafe al_save_bitmap as saveBitmap { `String', id `Bitmap' } -> `Int' #}
{#fun unsafe al_save_bitmap_f as saveBitmapF { id `File', `String', id `Bitmap' } -> `Int' #}
