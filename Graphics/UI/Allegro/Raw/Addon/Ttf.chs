{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Addon.Ttf where

import Data.Word

import C2HS
{#import Graphics.UI.Allegro.Raw.Addon.Font #}

#include "allegro-raw.h"

data TtfFlags = NoKerning
              | Monochrome
                deriving (Show, Eq, Ord, Read, Bounded)

instance Enum TtfFlags where
    toEnum 1 = NoKerning
    toEnum 2 = Monochrome
    toEnum _ = error "TtfFlags.toEnum: bad argument"
    fromEnum NoKerning = 1
    fromEnum Monochrome = 2

{#fun unsafe al_load_ttf_font as loadTtfFont { `String', `Int', cFromEnumFlags `[TtfFlags]' } -> `Font' fontPtrToFont* #}
{#fun unsafe al_load_ttf_font_f as loadTtfFontF { id `File', `String', `Int', cFromEnumFlags `[TtfFlags]' } -> `Font' fontPtrToFont* #}
{#fun unsafe al_init_ttf_addon as initTtfAddon { } -> `Bool' #}
{#fun unsafe al_shutdown_ttf_addon as shutdownTtfAddon { } -> `()' #}
{#fun unsafe al_get_allegro_ttf_version as getAllegroTtfVersion { } -> `Word32' #}
