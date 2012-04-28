{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Addon.Font where

import Data.Word

import C2HS
import Internal
{#import Graphics.UI.Allegro.Raw.Bitmap #}
{#import Graphics.UI.Allegro.Raw.Utf8 #}
{#import Graphics.UI.Allegro.Raw.Color #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Font_
{#pointer *FONT as Font foreign -> Font_ #}

instance Storable Font_ where
    sizeOf _ = {#sizeof FONT #}
    alignment _ = {#alignof FONT #}
    peek _ = error "Font_.peek: unsupported operation"
    poke _ _ = error "Font_.poke: unsupported operation"

foreign import ccall "allegro-raw.h &al_destroy_font"
    destroyFontPtr :: FinalizerPtr Font_

fontPtrToFont :: Ptr Font_ -> IO Font
fontPtrToFont = newForeignPtr destroyFontPtr

destroyFont :: Font -> IO ()
destroyFont = finalizeForeignPtr

data Align = AlignLeft
           | AlignCentre
           | AlignRight
             deriving (Show, Eq, Ord, Enum, Read, Bounded)

{#fun unsafe al_register_font_loader as registerFontLoader { `String', id `FunPtr (CString -> CInt -> CInt -> IO (Ptr Font_))'} -> `Bool' #}
{#fun unsafe al_load_bitmap_font as loadBitmapFont { `String' } -> `Font' fontPtrToFont* #}
{#fun unsafe al_load_font as loadFont { `String', `Int', `Int'} -> `Font' fontPtrToFont* #}

{#fun unsafe al_grab_font_from_bitmap as grabFontFromBitmap' { withForeignPtr* `Bitmap', `Int', id `Ptr CInt' } -> `Font' fontPtrToFont* #}
grabFontFromBitmap :: Bitmap -> [Int] -> IO Font
grabFontFromBitmap b xs = let l = length xs
                           in allocaArray l $ \p -> do
                                pokeArray p (map fromIntegral xs)
                                grabFontFromBitmap' b l p

{#fun unsafe al_draw_ustr_w as drawUstr { withForeignPtr* `Font', withT* `Color', `Float', `Float', cFromEnum `Align', withForeignPtr* `Ustr' } -> `()' #}
{#fun unsafe al_draw_text_w as drawText { withForeignPtr* `Font', withT* `Color', `Float', `Float', cFromEnum `Align', `String' } -> `()' #}
{#fun unsafe al_draw_justified_text_w as drawJustifiedText { withForeignPtr* `Font', withT* `Color', `Float', `Float', `Float', `Float', cFromEnum `Align', `String' } -> `()' #}
{#fun unsafe al_draw_justified_ustr_w as drawJustifiedUstr { withForeignPtr* `Font', withT* `Color', `Float', `Float', `Float', `Float', cFromEnum `Align', withForeignPtr* `Ustr' } -> `()' #}


{#fun unsafe al_get_text_width as getTextWidth { withForeignPtr* `Font', `String' } -> `Int' #}
{#fun unsafe al_get_ustr_width as getUstrWidth { withForeignPtr* `Font', withForeignPtr* `Ustr' } -> `Int' #}
{#fun unsafe al_get_font_line_height as getFontLineHeight { withForeignPtr* `Font' } -> `Int' #}

{#fun unsafe al_get_font_ascent as getFontAscent { withForeignPtr* `Font' } -> `Int' #}
{#fun unsafe al_get_font_descent as getFontDescent { withForeignPtr* `Font' } -> `Int' #}

{#fun unsafe al_get_ustr_dimensions as getUstrDimensions { withForeignPtr* `Font', withForeignPtr* `Ustr', alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv* } -> `()' #}
{#fun unsafe al_get_text_dimensions as getTextDimensions { withForeignPtr* `Font', `String', alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv* } -> `()' #}
{#fun unsafe al_init_font_addon as initFontAddon { } -> `()' #}
{#fun unsafe al_shutdown_font_addon as shutdownFontAddon { } -> `()' #}
{#fun unsafe al_get_allegro_font_version as getAllegroFontVersion { } -> `Word32' #}
