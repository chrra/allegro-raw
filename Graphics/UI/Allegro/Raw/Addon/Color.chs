{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.UI.Allegro.Raw.Addon.Color where

import Data.Word

import C2HS
{#import Graphics.UI.Allegro.Raw.Color #}

#include "allegro-raw.h"

alloca8Bytes :: (Ptr a -> IO b) -> IO b
alloca8Bytes = allocaBytes 8

{#fun unsafe al_get_allegro_color_version as getAllegroColorVersion { } -> `Word32' #}

{#fun unsafe al_color_hsv_to_rgb as colorHsvToRgb { `Float', `Float', `Float', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `()' #}
{#fun unsafe al_color_rgb_to_hsl as colorRgbToHsl { `Float', `Float', `Float', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `()' #}
{#fun unsafe al_color_rgb_to_hsv as colorRgbToHsv { `Float', `Float', `Float', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `()' #}
{#fun unsafe al_color_name_to_rgb as colorNameToRgb { `String', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `Bool' #}
{#fun unsafe al_color_rgb_to_name as colorRgbToName { `Float', `Float', `Float' } -> `String' #}
{#fun unsafe al_color_cmyk_to_rgb as colorCmykToRgb { `Float', `Float', `Float', `Float', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `()' #}
{#fun unsafe al_color_rgb_to_cmyk as colorRgbToCmyk { `Float', `Float', `Float', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `()' #}
{#fun unsafe al_color_yuv_to_rgb as colorYuvToRgb { `Float', `Float', `Float', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `()' #}
{#fun unsafe al_color_rgb_to_yuv as colorRgbToYuv { `Float', `Float', `Float', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `()' #}
{#fun unsafe al_color_rgb_to_html as colorRgbToHtml { `Float', `Float', `Float', alloca8Bytes- `String' peekCString* } -> `()' #}
{#fun unsafe al_color_html_to_rgb as colorHtmlToRgb { `String', alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv*, alloca- `Float' peekFloatConv* } -> `()' #}
{#fun unsafe al_color_yuv_w as colorYuv { `Float', `Float', `Float', alloca- `Color' peek* } -> `()' #}
{#fun unsafe al_color_cmyk_w as colorCmyk { `Float', `Float', `Float', `Float', alloca- `Color' peek* } -> `()' #}
{#fun unsafe al_color_hsl_w as colorHsl { `Float', `Float', `Float', alloca- `Color' peek* } -> `()' #}
{#fun unsafe al_color_hsv_w as colorHsv { `Float', `Float', `Float', alloca- `Color' peek* } -> `()' #}
{#fun unsafe al_color_name_w as colorName { `String', alloca- `Color' peek* } -> `()' #}
{#fun unsafe al_color_html_w as colorHtml { `String', alloca- `Color' peek* } -> `()' #}
