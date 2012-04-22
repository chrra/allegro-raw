{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Path where

import C2HS
import Internal

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Path'
{#pointer *PATH as Path -> Path' #}

{#fun unsafe al_create_path as createPath { `String' } -> `Path' id #}
{#fun unsafe al_create_path_for_directory as createPathForDirectory { `String' } -> `Path' id #}
{#fun unsafe al_clone_path as clonePath { id `Path' } -> `Path' id #}

{#fun unsafe al_get_path_num_components as getPathNumComponents { id `Path' } -> `Int' #}
{#fun unsafe al_get_path_component as getPathComponent { id `Path', `Int' } -> `String' #}
{#fun unsafe al_replace_path_component as replacePathComponent { id `Path', `Int', `String' } -> `()' #}
{#fun unsafe al_remove_path_component as removePathComponent { id `Path', `Int' } -> `()' #}
{#fun unsafe al_insert_path_component as insertPathComponent { id `Path', `Int', `String' } -> `()' #}
{#fun unsafe al_get_path_tail as getPathTail { id `Path' } -> `String' #}
{#fun unsafe al_drop_path_tail as dropPathTail { id `Path' } -> `()' #}
{#fun unsafe al_append_path_component as appendPathComponent { id `Path', `String' } -> `()' #}
{#fun unsafe al_join_paths as joinPaths { id `Path', id `Path' } -> `Bool' #}
{#fun unsafe al_rebase_path as rebasePath { id `Path', id `Path' } -> `Bool' #}
{#fun unsafe al_path_cstr as pathString { id `Path', cFromEnum `Char' } -> `String' #}
{#fun unsafe al_destroy_path as destroyPath { id `Path' } -> `()' #}

{#fun unsafe al_set_path_drive as setPathDrive { id `Path', `String' } -> `()' #}
{#fun unsafe al_get_path_drive as getPathDrive { id `Path' } -> `String' #}

{#fun unsafe al_set_path_filename as setPathFilename { id `Path', `String' } -> `()' #}
{#fun unsafe al_get_path_filename as getPathFilename { id `Path' } -> `String' #}

{#fun unsafe al_get_path_extension as getPathExtension { id `Path' } -> `String' #}
{#fun unsafe al_set_path_extension as setPathExtension { id `Path', `String' } -> `Bool' #}
{#fun unsafe al_get_path_basename as getPathBasename { id `Path' } -> `String' #}

{#fun unsafe al_make_path_canonical as makePathCanonical { id `Path' } -> `Bool' #}
