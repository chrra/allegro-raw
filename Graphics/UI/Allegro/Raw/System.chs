{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.System where

import C2HS
import Internal
{#import Graphics.UI.Allegro.Raw.Config #}
{#import Graphics.UI.Allegro.Raw.Path #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data System'
{#pointer *SYSTEM as System -> System' #}

{#fun unsafe al_init_ as initialize { } -> `()' #}
{#fun unsafe al_install_system as installSystem { `Int', id `FunPtr (FunPtr (IO ()) -> IO CInt)' } -> `Int' #}
{#fun unsafe al_uninstall_system as uninstallSystem { } -> `()' #}
{#fun unsafe al_is_system_installed as isSystemInstalled { } -> `Bool' #}

{#fun unsafe al_get_system_driver as getSystemDriver { } -> `System' id #}
{#fun unsafe al_get_system_config as getSystemConfig { } -> `Config' id #}

data PathType = ResourcesPath
              | TempPath
              | UserDataPath
              | UserHomePath
              | UserSettingsPath
              | UserDocumentsPath
              | ExenamePath
                deriving (Show, Eq, Ord, Read, Bounded, Enum)

{#fun unsafe al_get_standard_path as getStandardPath { cFromEnum `PathType' } -> `Path' id #}
{#fun unsafe al_set_org_name as setOrgName { `String' } -> `()' #}
{#fun unsafe al_set_app_name as setAppName { `String' } -> `()' #}
{#fun unsafe al_get_org_name as getOrgName { } -> `String' #}
{#fun unsafe al_get_app_name as getAppName { } -> `String' #}

{#fun unsafe al_inhibit_screensaver as inhibitScreensaver { `Bool' } -> `Bool' #}
