{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Addon.Primitives where

import Control.Applicative
import Data.Word

import C2HS
import Internal
{#import Graphics.UI.Allegro.Raw.Color #}
{#import Graphics.UI.Allegro.Raw.Bitmap #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

{#enum PRIM_TYPE as PrimType {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
{#enum PRIM_ATTR as PrimAttr {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
{#enum PRIM_STORAGE as PrimStorage {underscoreToCase} deriving (Show, Eq, Ord, Read) #}

data VertexElement = VertexElement
                   { vertexElementAttribute :: PrimAttr
                   , vertexElementStorage :: PrimStorage
                   , vertexElementOffset :: Int
                   } deriving (Show, Eq, Ord, Read)

{#pointer *VERTEX_ELEMENT as VertexElementPtr -> VertexElement #}

instance Storable VertexElement where
    sizeOf _ = {#sizeof VERTEX_ELEMENT #}
    alignment _ = {#alignof VERTEX_ELEMENT #}
    peek p = VertexElement
                <$> liftA cToEnum ({#get VERTEX_ELEMENT->attribute #} p)
                <*> liftA cToEnum ({#get VERTEX_ELEMENT->storage #} p)
                <*> liftA fromIntegral ({#get VERTEX_ELEMENT->offset #} p)
    poke p VertexElement {..} = do
        {#set VERTEX_ELEMENT->attribute #} p $ cFromEnum vertexElementAttribute
        {#set VERTEX_ELEMENT->storage #} p $ cFromEnum vertexElementStorage
        {#set VERTEX_ELEMENT->offset #} p $ fromIntegral vertexElementOffset

data VertexDecl_
{#pointer *VERTEX_DECL as VertexDecl foreign -> VertexDecl_ #}

foreign import ccall "allegro-raw.h &al_destroy_vertex_decl"
    destroyVertexDeclPtr :: FinalizerPtr VertexDecl_

vertexDeclPtrToVertexDecl :: Ptr VertexDecl_ -> IO VertexDecl
vertexDeclPtrToVertexDecl = newForeignPtr destroyVertexDeclPtr

destroyVertexDecl :: VertexDecl -> IO ()
destroyVertexDecl = finalizeForeignPtr

data Vertex = Vertex
            { vertexX, vertexY, vertexZ :: Float
            , vertexU, vertexV :: Float
            , vertexColor :: Color
            } deriving (Show, Eq, Ord, Read)
{#pointer *VERTEX as VertexPtr -> Vertex #}


instance Storable Vertex where
    sizeOf _ = {#sizeof VERTEX #}
    alignment _ = {#alignof VERTEX #}
    peek p = Vertex
                <$> liftA realToFrac ({#get VERTEX->x #} p)
                <*> liftA realToFrac ({#get VERTEX->y #} p)
                <*> liftA realToFrac ({#get VERTEX->z #} p)
                <*> liftA realToFrac ({#get VERTEX->u #} p)
                <*> liftA realToFrac ({#get VERTEX->v #} p)
                <*> peek (p `plusPtr` (sizeOf (undefined :: Float) * 5))
    poke p Vertex {..} = do
        {#set VERTEX->x #} p $ realToFrac vertexX
        {#set VERTEX->y #} p $ realToFrac vertexY
        {#set VERTEX->z #} p $ realToFrac vertexZ
        {#set VERTEX->u #} p $ realToFrac vertexU
        {#set VERTEX->v #} p $ realToFrac vertexV
        poke (p `plusPtr` (sizeOf (undefined :: Float) * 5)) vertexColor

{#fun unsafe al_get_allegro_primitives_version as getAllegroPrimitivesVersion { } -> `Word32' #}

{#fun unsafe al_init_primitives_addon as initPrimitivesAddon { } -> `Bool' #}
{#fun unsafe al_shutdown_primitives_addon as shutdownPrimitivesAddon { } -> `()' #}
{#fun unsafe al_draw_prim as drawPrim { id `Ptr ()', withForeignPtr* `VertexDecl', withForeignPtr* `Bitmap', `Int', `Int', cFromEnum `PrimType' } -> `Int' #}
{#fun unsafe al_draw_indexed_prim as drawIndexedPrim { id `Ptr ()', withForeignPtr* `VertexDecl', withForeignPtr* `Bitmap', withArray* `[CInt]', `Int', cFromEnum `PrimType' } -> `Int' #}
{#fun unsafe al_create_vertex_decl as createVertexDecl { withArray* `[VertexElement]', `Int' } -> `VertexDecl' vertexDeclPtrToVertexDecl* #}

{#fun al_draw_soft_triangle as drawSoftTriangle { withT* `Vertex', withT* `Vertex', withT* `Vertex', id `Ptr ()', id `FunPtr (Ptr () -> VertexPtr -> VertexPtr -> VertexPtr -> IO ())', id `FunPtr (Ptr () -> CInt -> CInt -> CInt -> CInt -> IO ())', id `FunPtr (Ptr () -> CInt -> IO ())', id `FunPtr (Ptr () -> CInt -> CInt -> CInt -> IO ())' } -> `()' #}
{#fun al_draw_soft_line as drawSoftLine { withT* `Vertex', withT* `Vertex', id `Ptr ()', id `FunPtr (Ptr () -> CInt -> CInt -> VertexPtr -> VertexPtr -> IO ())', id `FunPtr (Ptr () -> CInt -> IO ())', id `FunPtr (Ptr () -> CInt -> CInt -> IO ())'  } -> `()' #}

{#fun unsafe al_draw_line_w as drawLine { `Float', `Float', `Float', `Float', withT* `Color', `Float' } -> `()' #}
{#fun unsafe al_draw_triangle_w as drawTriangle { `Float', `Float', `Float', `Float', `Float', `Float', withT* `Color', `Float' } -> `()' #}
{#fun unsafe al_draw_rectangle_w as drawRectangle { `Float', `Float', `Float', `Float', withT* `Color', `Float' } -> `()' #}
{#fun unsafe al_draw_rounded_rectangle_w as drawRoundedRectangle { `Float', `Float', `Float', `Float', `Float', `Float', withT* `Color', `Float' } -> `()' #}
{#fun unsafe al_calculate_arc as calculateArc { alloca- `Float', `Int', `Float', `Float', `Float', `Float', `Float', `Float', `Float', `Int' } -> `()' #}
{#fun unsafe al_draw_circle_w as drawCircle { `Float', `Float', `Float', withT* `Color', `Float'} -> `()' #}
{#fun unsafe al_draw_ellipse_w as drawEllipse { `Float', `Float', `Float', `Float', withT* `Color', `Float' } -> `()' #}
{#fun unsafe al_draw_arc_w as drawArc { `Float', `Float', `Float', `Float', `Float', withT* `Color', `Float' } -> `()' #}
--TODO: {#fun unsafe al_calculate_spline as calculateSpline' { id `Ptr CFloat', `Int', withArray* '[Float]', `Float', `Int'  } -> `()' #}
{#fun unsafe al_draw_spline_w as drawSpline { `Float', `Float', `Float', `Float', `Float', `Float', `Float', `Float', withT* `Color', `Float' } -> `()' #}
-- TODO: {#fun unsafe al_calculate_ribbon as  { } -> `()' #}
{#fun unsafe al_draw_ribbon_w as drawRibbon' { withArray* `[CFloat]', `Int', withT* `Color', `Float', `Int' } -> `()' #}
drawRibbon :: [(Float, Float)] -> Color -> Float -> IO ()
drawRibbon p c t = do
    let ps = map realToFrac . concat $ map (\(x,y) -> [x, y]) p
    drawRibbon' ps (sizeOf (undefined :: CFloat) * 2) c t (length ps {- I don't know... -})

{#fun unsafe al_draw_filled_triangle_w as drawFilledTriangle { `Float', `Float', `Float', `Float', `Float', `Float', withT* `Color' } -> `()' #}
{#fun unsafe al_draw_filled_rectangle_w as drawFilledRectangle { `Float', `Float', `Float', `Float', withT* `Color' } -> `()' #}
{#fun unsafe al_draw_filled_ellipse_w as drawFilledEclipse { `Float', `Float', `Float', `Float', withT* `Color' } -> `()' #}
{#fun unsafe al_draw_filled_circle_w as drawFilledCircle { `Float', `Float', `Float', withT* `Color' } -> `()' #}
{#fun unsafe al_draw_filled_rounded_rectangle_w as drawFilledRoundedRectangle { `Float', `Float', `Float', `Float', `Float', `Float', withT* `Color' } -> `()' #}
