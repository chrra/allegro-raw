{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.File where

import Control.Applicative
import Data.Int

import C2HS
{#import Graphics.UI.Allegro.Raw.Path #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data File'
{#pointer *FILE as File -> File' #}

data FileInterface
    = FileInterface
    { fiOpen      :: String -> String -> IO (Ptr ())
    , fiClose     :: File -> IO ()
    , fiFread     :: File -> Ptr () -> Int -> IO Int
    , fiFwrite    :: File -> Ptr () -> Int -> IO Int
    , fiFflush    :: File -> IO Int
    , fiFtell     :: File -> IO Int64
    , fiFseek     :: File -> Int64 -> Int -> IO Int
    , fiFeof      :: File -> IO Int
    , fiFerror    :: File -> IO Int
    , fiFclearerr :: File -> IO ()
    , fiFungetc   :: File -> Int -> IO Int
    , fiFsize     :: File -> IO Int
    }
{#pointer *FILE_INTERFACE as FileInterfacePtr -> FileInterface #}

instance Storable FileInterface where
    sizeOf _ = {#sizeof FILE_INTERFACE #}
    alignment _ = {#alignof FILE_INTERFACE #}
    peek _ = error "FileInterface.peek: TODO"
    poke _ _ = error "FileInterface.poke: TODO"

{#enum SEEK as Seek {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
{#fun al_fopen as fopen { `String', `String' } -> `File' id #}
{#fun al_fopen_interface as fopenInterface { withT* `FileInterface', `String', `String' } -> `File' id #}
{#fun al_create_file_handle as createFileHandle { withT* `FileInterface', id `Ptr ()' } -> `File' id #}
{#fun al_fclose as fclose { id `File' } -> `()' #}
{#fun al_fread as fread { id `File', id `Ptr ()', `Int' } -> `Int' #}
{#fun al_fwrite as fwrite { id `File', id `Ptr ()', `Int' } -> `Int' #}
{#fun al_fflush as fflush { id `File' } -> `Bool' #}
{#fun al_ftell as ftell { id `File' } -> `Int64' #}
{#fun al_fseek as fseek { id `File', `Int64', `Int' } -> `Bool' #}
{#fun al_feof as feof { id `File' } -> `Bool' #}
{#fun al_ferror as ferror { id `File' } -> `Bool' #}
{#fun al_fclearerr as fclearerr { id `File' } -> `()' #}
{#fun al_fungetc as fungetc { id `File', `Int' } -> `Int' #}
{#fun al_fsize as fsize { id `File' } -> `Int64' #}

{#fun al_fgetc as fgetc { id `File' } -> `Int' #}
{#fun al_fputc as fputc { id `File', `Int' } -> `Int' #}
{#fun al_fread16le as fread16le { id `File' } -> `Int16' #}
{#fun al_fread16be as fread16be { id `File' } -> `Int16' #}
{#fun al_fwrite16le as fwrite16le { id `File', `Int16' } -> `Int' #}
{#fun al_fwrite16be as fwrite16be { id `File', `Int16' } -> `Int' #}
{#fun al_fread32le as fread32le { id `File' } -> `Int32' #}
{#fun al_fread32be as fread32be { id `File' } -> `Int32' #}
{#fun al_fwrite32le as fwrite32le { id `File', `Int32' } -> `Int' #}
{#fun al_fwrite32be as fwrite32be { id `File', `Int32' } -> `Int' #}
{#fun al_fgets as fgets' { id `File', id `CString', `Int' } -> `CString' id #}
fgets :: File -> Int -> IO (Maybe String)
fgets f i = do buf <- mallocBytes i
               out <- fgets' f buf i
               maybePeek peekCString out <* free buf

{#fun al_fputs as fputs { id `File', `String' } -> `Int' #}
{#fun al_fopen_fd as fopenFd { `Int', `String' } -> `File' id #}
{#fun al_make_temp_file as makeTempFile { `String', id `Ptr Path' } -> `File' id #}
{#fun al_get_new_file_interface as getNewFileInterface { } -> `FileInterface' peek* #}
{#fun al_set_new_file_interface as setNewFileInterface { withT* `FileInterface' } -> `()' #}
{#fun al_set_standard_file_interface as setStandardFileInterface { } -> `()' #}
{#fun al_get_file_userdata as getFileUserdata { id `File' } -> `Ptr ()' id #}
