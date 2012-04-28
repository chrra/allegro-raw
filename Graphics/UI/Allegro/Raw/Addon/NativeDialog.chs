{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Addon.NativeDialog where

import Data.Word

import C2HS
import Internal

{#import Graphics.UI.Allegro.Raw.DisplayData #}
{#import Graphics.UI.Allegro.Raw.Events #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

data Filechooser_
{#pointer *FILECHOOSER as Filechooser -> Filechooser_ #}

data Textlog_
{#pointer *TEXTLOG as Textlog -> Textlog_ #}

data FilechooserFlags = FileMustExist
                      | Save
                      | Folder
                      | Pictures
                      | ShowHidden
                      | Multiple
                        deriving (Show, Eq, Ord, Bounded, Read)

instance Enum FilechooserFlags where
    toEnum 1  = FileMustExist
    toEnum 2  = Save
    toEnum 4  = Folder
    toEnum 8  = Pictures
    toEnum 16 = ShowHidden
    toEnum 32 = Multiple
    toEnum _  = error "FilechooserFlags.toEnum: bad argument"
    fromEnum FileMustExist = 1
    fromEnum Save          = 2
    fromEnum Folder        = 4
    fromEnum Pictures      = 8
    fromEnum ShowHidden    = 16
    fromEnum Multiple      = 32

    succ x = toEnum (fromEnum x * 2)
    pred x = toEnum (fromEnum x `div` 2)

    enumFrom     x   = enumFromTo x maxBound
    enumFromTo x y | x > y = []
                   | x == y = [y]
                   | otherwise = x : enumFromTo (succ x) y

data MessageboxFlags = Warn
                     | Error
                     | OkCancel
                     | YesNo
                     | Question
                       deriving (Show, Eq, Ord, Bounded, Read)

instance Enum MessageboxFlags where
    toEnum 1  = Warn
    toEnum 2  = Error
    toEnum 4  = OkCancel
    toEnum 8  = YesNo
    toEnum 16 = Question
    toEnum _  = error "MessageboxFlags.toEnum: bad argument"
    fromEnum Warn     = 1
    fromEnum Error    = 2
    fromEnum OkCancel = 4
    fromEnum YesNo    = 8
    fromEnum Question = 16

    succ x = toEnum (fromEnum x * 2)
    pred x = toEnum (fromEnum x `div` 2)

    enumFrom     x   = enumFromTo x maxBound
    enumFromTo x y | x > y = []
                   | x == y = [y]
                   | otherwise = x : enumFromTo (succ x) y

data TextlogFlags = NoClose
                  | Monospace
                    deriving (Show, Eq, Ord, Bounded, Read)

instance Enum TextlogFlags where
    toEnum 1 = NoClose
    toEnum 2 = Monospace
    toEnum _ = error "TextlogFlags.toEnum: bad argument"
    fromEnum NoClose = 1
    fromEnum Monospace = 2

{#fun unsafe al_create_native_file_dialog as createNativeFileDialog { `String', `String', `String', cFromEnumFlags `[FilechooserFlags]' } -> `Filechooser' id #}
{#fun unsafe al_show_native_file_dialog as showNativeFileDialog { id `Display', id `Filechooser' } -> `Bool' #}
{#fun unsafe al_get_native_file_dialog_count as getNativeFileDialogCount { id `Filechooser' } -> `Int' #}
{#fun unsafe al_get_native_file_dialog_path as getNativeFileDialogPath { id `Filechooser', `Int' } -> `String' #}
{#fun unsafe al_destroy_native_file_dialog as destroyNativeFileDialog { id `Filechooser' } -> `()' #}

{#fun unsafe al_show_native_message_box as showNativeMessageBox { id `Display', `String', `String', `String', `String', cFromEnumFlags `[MessageboxFlags]' } -> `()' #}

{#fun unsafe al_open_native_text_log as openNativeTextLog { `String', cFromEnumFlags `[TextlogFlags]'} -> `Textlog' id #}
{#fun unsafe al_close_native_text_log as closeNativeTextLog { id `Textlog' } -> `()' #}
{#fun unsafe al_append_native_text_log_w as appendNativeTextLog { id `Textlog', `String' } -> `()' #}
{#fun unsafe al_get_native_text_log_event_source as getNativeTextLogEventSource { id `Textlog' } -> `EventSource' id #}
{#fun unsafe al_get_allegro_native_dialog_version as getAllegroNativeDialogVersion { } -> `Word32' #}
