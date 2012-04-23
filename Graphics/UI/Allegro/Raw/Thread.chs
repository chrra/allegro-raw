{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}

-- | Using anything here is probably a horrible idea.
-- Included for a sense of completeness and peace of mind for the author.
module Graphics.UI.Allegro.Raw.Thread where

import C2HS
import Internal
{#import Graphics.UI.Allegro.Raw.Altime #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Thread_
{#pointer *THREAD as Thread -> Thread_ #}

data Mutex_
{#pointer *MUTEX as Mutex -> Mutex_ #}

data Cond_
{#pointer *COND as Cond -> Cond_ #}

{#fun al_create_thread as createThread { id `FunPtr (Thread -> Ptr () -> IO (Ptr ()))', id `Ptr ()' } -> `Thread' id #}
{#fun al_start_thread as startThread { id `Thread' } -> `()' #}
{#fun al_join_thread as joinThread { id `Thread', withMalloc- `Ptr (Ptr ())' id } -> `()' #}
{#fun al_set_thread_should_stop as setThreadShouldStop { id `Thread' } -> `()' #}
{#fun al_get_thread_should_stop as getThreadShouldStop { id `Thread' } -> `Bool' #}
{#fun al_destroy_thread as destroyThread { id `Thread' } -> `()' #}
{#fun al_run_detached_thread as runDetachedThread { id `FunPtr (Ptr () -> IO (Ptr ()))', id `Ptr ()' } -> `()' #}

{#fun al_create_mutex as createMutex { } -> `Mutex' id #}
{#fun al_create_mutex_recursive as createMutexRecursive { } -> `Mutex' id #}
{#fun al_lock_mutex as lockMutex { id `Mutex' } -> `()' #}
{#fun al_unlock_mutex as unlockMutex { id `Mutex' } -> `()' #}
{#fun al_destroy_mutex as destroyMutex { id `Mutex' } -> `()' #}

{#fun al_create_cond as createCond { } -> `Cond' id #}
{#fun al_destroy_cond as destroyCond { id `Cond' } -> `()' #}
{#fun al_wait_cond as waitCond { id `Cond', id `Mutex' } -> `()' #}
{#fun al_wait_cond_until as waitCondUntil { id `Cond', id `Mutex', id `Timeout' } -> `Int' #}
{#fun al_broadcast_cond as broadcastCond { id `Cond' } -> `()' #}
{#fun al_signal_cond as signalCond { id `Cond' } -> `()' #}
