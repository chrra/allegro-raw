{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Memory where

import Control.Applicative
import GHC.Stack

import C2HS

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data MemoryInterface
    = MemoryInterface
    { miMalloc :: Int -> Int -> String -> String -> IO (Ptr ())
    , miFree :: Ptr () -> Int -> String -> String -> IO ()
    , miRealloc :: Ptr () -> Int -> Int -> String -> String -> IO (Ptr ())
    , miCalloc :: Int -> Int -> Int -> String -> String -> IO (Ptr ())
    }
{#pointer *MEMORY_INTERFACE as MemoryInterfacePtr -> MemoryInterface #}

instance Storable MemoryInterface where
    sizeOf _ = {#sizeof MEMORY_INTERFACE #}
    alignment _ = {#alignof MEMORY_INTERFACE #}
    peek _ = error "MemoryInterface.peek: TODO"
    poke _ _ = error "MemoryInterface.poke: TODO"

{#fun unsafe al_set_memory_interface as setMemoryInterface { withT* `MemoryInterface' } -> `()' #}

{#fun unsafe al_malloc_with_context as mallocWithContext { `Int', `Int', `String', `String' } -> `Ptr ()' id #}
{#fun unsafe al_free_with_context as freeWithContext { id `Ptr ()', `Int', `String', `String' } -> `()' #}
{#fun unsafe al_realloc_with_context as reallocWithContext { id `Ptr ()', `Int', `Int', `String', `String' } -> `Ptr ()' id #}
{#fun unsafe al_calloc_with_context as callocWithContext { `Int', `Int', `Int', `String', `String' } -> `Ptr ()' id #}
foreign import ccall "allegro-raw.h &al_free_in_finalizer"
    alFreeInFinalizer :: FinalizerPtr a

newAlForeignPtr :: Ptr a -> IO (ForeignPtr a)
newAlForeignPtr = newForeignPtr alFreeInFinalizer

-- At least try:

alMalloc :: Int -> IO (Ptr ())
alMalloc n = do stack <- renderStack <$> currentCallStack
                mallocWithContext n 0 "unknown.hs" stack

alFree :: Ptr () -> IO ()
alFree p = do stack <- renderStack <$> currentCallStack
              freeWithContext p 0 "unknown.hs" stack

alRealloc :: Ptr () -> Int -> IO (Ptr ())
alRealloc p i = do stack <- renderStack <$> currentCallStack
                   reallocWithContext p i 0 "unknown.hs" stack

alCalloc :: Int -> Int -> IO (Ptr ())
alCalloc c n = do stack <- renderStack <$> currentCallStack
                  callocWithContext c n 0 "unknown.hs" stack
