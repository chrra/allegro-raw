{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Config where

import C2HS
import Internal
{#import Graphics.UI.Allegro.Raw.File #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Config'
{#pointer *CONFIG as Config -> Config' #}
data ConfigSection'
{#pointer *CONFIG_SECTION as ConfigSection -> ConfigSection' #}
{#pointer *CONFIG_SECTION_ITERATOR as ConfigSectionIterator -> ConfigSection #}
data ConfigEntry'
{#pointer *CONFIG_ENTRY as ConfigEntry -> ConfigEntry' #}
{#pointer *CONFIG_ENTRY_ITERATOR as ConfigEntryIterator -> ConfigEntry #}

{#fun unsafe al_create_config as createConfig { } -> `Config' id #}
{#fun unsafe al_add_config_section as addConfigSection { id `Config', `String' } -> `()' #}
{#fun unsafe al_set_config_value as setConfigValue { id `Config', `String', `String', `String'} -> `()' #}
{#fun unsafe al_add_config_comment as addConfigComment { id `Config', `String', `String' } -> `()' #}
{#fun unsafe al_get_config_value as getConfigValue { id `Config', `String', `String' } -> `String' #}
{#fun unsafe al_load_config_file as loadConfigFile { `String' } -> `Config' id #}
{#fun unsafe al_load_config_file_f as loadConfigFileF { id `File' } -> `Config' id #}
{#fun unsafe al_save_config_file as saveConfigFile { `String', id `Config' } -> `Bool' #}
{#fun unsafe al_save_config_file_f as saveConfigFileF { id `File', id `Config' } -> `Bool' #}
{#fun unsafe al_merge_config_into as mergeConfigInto { id `Config', id `Config' } -> `()' #}
{#fun unsafe al_merge_config as mergeConfig { id `Config', id `Config'} -> `Config' id #}
{#fun unsafe al_destroy_config as destroyConfig { id `Config' } -> `()' #}

{#fun unsafe al_get_next_config_section as getNextConfigSection { id `ConfigSectionIterator' } -> `String' #}
{#fun unsafe al_get_first_config_section as getFirstConfigSection { id `Config', withMalloc- `ConfigSectionIterator' id } -> `String' #}
{#fun unsafe al_get_first_config_entry as getFirstConfigEntry { id `Config', `String', withMalloc- `ConfigEntryIterator' id } -> `String' #}
{#fun unsafe al_get_next_config_entry as getNextConfigEntry { id `ConfigEntryIterator' } -> `String' #}
