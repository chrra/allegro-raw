module Graphics.UI.Allegro.Raw.Keycodes where

data Key
    = KeyA
    | KeyB
    | KeyC
    | KeyD
    | KeyE
    | KeyF
    | KeyG
    | KeyH
    | KeyI
    | KeyJ
    | KeyK
    | KeyL
    | KeyM
    | KeyN
    | KeyO
    | KeyP
    | KeyQ
    | KeyR
    | KeyS
    | KeyT
    | KeyU
    | KeyV
    | KeyW
    | KeyX
    | KeyY
    | KeyZ
    | Key0
    | Key1
    | Key2
    | Key3
    | Key4
    | Key5
    | Key6
    | Key7
    | Key8
    | Key9
    | KeyPad0
    | KeyPad1
    | KeyPad2
    | KeyPad3
    | KeyPad4
    | KeyPad5
    | KeyPad6
    | KeyPad7
    | KeyPad8
    | KeyPad9
    | KeyF1
    | KeyF2
    | KeyF3
    | KeyF4
    | KeyF5
    | KeyF6
    | KeyF7
    | KeyF8
    | KeyF9
    | KeyF10
    | KeyF11
    | KeyF12
    | KeyEscape
    | KeyTilde
    | KeyMinus
    | KeyEquals
    | KeyBackspace
    | KeyTab
    | KeyOpenbrace
    | KeyClosebrace
    | KeyEnter
    | KeySemicolon
    | KeyQuote
    | KeyBackslash
    | KeyBackslash2
    | KeyComma
    | KeyFullstop
    | KeySlash
    | KeySpace
    | KeyInsert
    | KeyDelete
    | KeyHome
    | KeyEnd
    | KeyPgup
    | KeyPgdn
    | KeyLeft
    | KeyRight
    | KeyUp
    | KeyDown
    | KeyPadSlash
    | KeyPadAsterisk
    | KeyPadMinus
    | KeyPadPlus
    | KeyPadDelete
    | KeyPadEnter
    | KeyPrintscreen
    | KeyPause
    | KeyAbntC1
    | KeyYen
    | KeyKana
    | KeyConvert
    | KeyNoconvert
    | KeyAt
    | KeyCircumflex
    | KeyColon2
    | KeyKanji
    | KeyPadEquals
    | KeyBackquote
    | KeySemicolon2
    | KeyCommand
    | KeyUnknown
    | KeyOther Int
    | KeyLshift
    | KeyRshift
    | KeyLctrl
    | KeyRctrl
    | KeyAlt
    | KeyAltgr
    | KeyLwin
    | KeyRwin
    | KeyMenu
    | KeyScrolllock
    | KeyNumlock
    | KeyCapslock
      deriving (Show, Eq, Ord, Read)

instance Bounded Key where
    minBound = KeyA
    maxBound = KeyCapslock

instance Enum Key where
    fromEnum KeyA = 1
    fromEnum KeyB = 2
    fromEnum KeyC = 3
    fromEnum KeyD = 4
    fromEnum KeyE = 5
    fromEnum KeyF = 6
    fromEnum KeyG = 7
    fromEnum KeyH = 8
    fromEnum KeyI = 9
    fromEnum KeyJ = 10
    fromEnum KeyK = 11
    fromEnum KeyL = 12
    fromEnum KeyM = 13
    fromEnum KeyN = 14
    fromEnum KeyO = 15
    fromEnum KeyP = 16
    fromEnum KeyQ = 17
    fromEnum KeyR = 18
    fromEnum KeyS = 19
    fromEnum KeyT = 20
    fromEnum KeyU = 21
    fromEnum KeyV = 22
    fromEnum KeyW = 23
    fromEnum KeyX = 24
    fromEnum KeyY = 25
    fromEnum KeyZ = 26
    fromEnum Key0 = 27
    fromEnum Key1 = 28
    fromEnum Key2 = 29
    fromEnum Key3 = 30
    fromEnum Key4 = 31
    fromEnum Key5 = 32
    fromEnum Key6 = 33
    fromEnum Key7 = 34
    fromEnum Key8 = 35
    fromEnum Key9 = 36
    fromEnum KeyPad0 = 37
    fromEnum KeyPad1 = 38
    fromEnum KeyPad2 = 39
    fromEnum KeyPad3 = 40
    fromEnum KeyPad4 = 41
    fromEnum KeyPad5 = 42
    fromEnum KeyPad6 = 43
    fromEnum KeyPad7 = 44
    fromEnum KeyPad8 = 45
    fromEnum KeyPad9 = 46
    fromEnum KeyF1 = 47
    fromEnum KeyF2 = 48
    fromEnum KeyF3 = 49
    fromEnum KeyF4 = 50
    fromEnum KeyF5 = 51
    fromEnum KeyF6 = 52
    fromEnum KeyF7 = 53
    fromEnum KeyF8 = 54
    fromEnum KeyF9 = 55
    fromEnum KeyF10 = 56
    fromEnum KeyF11 = 57
    fromEnum KeyF12 = 58
    fromEnum KeyEscape = 59
    fromEnum KeyTilde = 60
    fromEnum KeyMinus = 61
    fromEnum KeyEquals = 62
    fromEnum KeyBackspace = 63
    fromEnum KeyTab = 64
    fromEnum KeyOpenbrace = 65
    fromEnum KeyClosebrace = 66
    fromEnum KeyEnter = 67
    fromEnum KeySemicolon = 68
    fromEnum KeyQuote = 69
    fromEnum KeyBackslash = 70
    fromEnum KeyBackslash2 = 71
    fromEnum KeyComma = 72
    fromEnum KeyFullstop = 73
    fromEnum KeySlash = 74
    fromEnum KeySpace = 75
    fromEnum KeyInsert = 76
    fromEnum KeyDelete = 77
    fromEnum KeyHome = 78
    fromEnum KeyEnd = 79
    fromEnum KeyPgup = 80
    fromEnum KeyPgdn = 81
    fromEnum KeyLeft = 82
    fromEnum KeyRight = 83
    fromEnum KeyUp = 84
    fromEnum KeyDown = 85
    fromEnum KeyPadSlash = 86
    fromEnum KeyPadAsterisk = 87
    fromEnum KeyPadMinus = 88
    fromEnum KeyPadPlus = 89
    fromEnum KeyPadDelete = 90
    fromEnum KeyPadEnter = 91
    fromEnum KeyPrintscreen = 92
    fromEnum KeyPause = 93
    fromEnum KeyAbntC1 = 94
    fromEnum KeyYen = 95
    fromEnum KeyKana = 96
    fromEnum KeyConvert = 97
    fromEnum KeyNoconvert = 98
    fromEnum KeyAt = 99
    fromEnum KeyCircumflex = 100
    fromEnum KeyColon2 = 101
    fromEnum KeyKanji = 102
    fromEnum KeyPadEquals = 103
    fromEnum KeyBackquote = 104
    fromEnum KeySemicolon2 = 105
    fromEnum KeyCommand = 106
    fromEnum KeyUnknown = 107
    fromEnum KeyLshift = 215
    fromEnum KeyRshift = 216
    fromEnum KeyLctrl = 217
    fromEnum KeyRctrl = 218
    fromEnum KeyAlt = 219
    fromEnum KeyAltgr = 220
    fromEnum KeyLwin = 221
    fromEnum KeyRwin = 222
    fromEnum KeyMenu = 223
    fromEnum KeyScrolllock = 224
    fromEnum KeyNumlock = 225
    fromEnum KeyCapslock = 226
    fromEnum (KeyOther x) = x
    toEnum 1 = KeyA
    toEnum 2 = KeyB
    toEnum 3 = KeyC
    toEnum 4 = KeyD
    toEnum 5 = KeyE
    toEnum 6 = KeyF
    toEnum 7 = KeyG
    toEnum 8 = KeyH
    toEnum 9 = KeyI
    toEnum 10 = KeyJ
    toEnum 11 = KeyK
    toEnum 12 = KeyL
    toEnum 13 = KeyM
    toEnum 14 = KeyN
    toEnum 15 = KeyO
    toEnum 16 = KeyP
    toEnum 17 = KeyQ
    toEnum 18 = KeyR
    toEnum 19 = KeyS
    toEnum 20 = KeyT
    toEnum 21 = KeyU
    toEnum 22 = KeyV
    toEnum 23 = KeyW
    toEnum 24 = KeyX
    toEnum 25 = KeyY
    toEnum 26 = KeyZ
    toEnum 27 = Key0
    toEnum 28 = Key1
    toEnum 29 = Key2
    toEnum 30 = Key3
    toEnum 31 = Key4
    toEnum 32 = Key5
    toEnum 33 = Key6
    toEnum 34 = Key7
    toEnum 35 = Key8
    toEnum 36 = Key9
    toEnum 37 = KeyPad0
    toEnum 38 = KeyPad1
    toEnum 39 = KeyPad2
    toEnum 40 = KeyPad3
    toEnum 41 = KeyPad4
    toEnum 42 = KeyPad5
    toEnum 43 = KeyPad6
    toEnum 44 = KeyPad7
    toEnum 45 = KeyPad8
    toEnum 46 = KeyPad9
    toEnum 47 = KeyF1
    toEnum 48 = KeyF2
    toEnum 49 = KeyF3
    toEnum 50 = KeyF4
    toEnum 51 = KeyF5
    toEnum 52 = KeyF6
    toEnum 53 = KeyF7
    toEnum 54 = KeyF8
    toEnum 55 = KeyF9
    toEnum 56 = KeyF10
    toEnum 57 = KeyF11
    toEnum 58 = KeyF12
    toEnum 59 = KeyEscape
    toEnum 60 = KeyTilde
    toEnum 61 = KeyMinus
    toEnum 62 = KeyEquals
    toEnum 63 = KeyBackspace
    toEnum 64 = KeyTab
    toEnum 65 = KeyOpenbrace
    toEnum 66 = KeyClosebrace
    toEnum 67 = KeyEnter
    toEnum 68 = KeySemicolon
    toEnum 69 = KeyQuote
    toEnum 70 = KeyBackslash
    toEnum 71 = KeyBackslash2
    toEnum 72 = KeyComma
    toEnum 73 = KeyFullstop
    toEnum 74 = KeySlash
    toEnum 75 = KeySpace
    toEnum 76 = KeyInsert
    toEnum 77 = KeyDelete
    toEnum 78 = KeyHome
    toEnum 79 = KeyEnd
    toEnum 80 = KeyPgup
    toEnum 81 = KeyPgdn
    toEnum 82 = KeyLeft
    toEnum 83 = KeyRight
    toEnum 84 = KeyUp
    toEnum 85 = KeyDown
    toEnum 86 = KeyPadSlash
    toEnum 87 = KeyPadAsterisk
    toEnum 88 = KeyPadMinus
    toEnum 89 = KeyPadPlus
    toEnum 90 = KeyPadDelete
    toEnum 91 = KeyPadEnter
    toEnum 92 = KeyPrintscreen
    toEnum 93 = KeyPause
    toEnum 94 = KeyAbntC1
    toEnum 95 = KeyYen
    toEnum 96 = KeyKana
    toEnum 97 = KeyConvert
    toEnum 98 = KeyNoconvert
    toEnum 99 = KeyAt
    toEnum 100 = KeyCircumflex
    toEnum 101 = KeyColon2
    toEnum 102 = KeyKanji
    toEnum 103 = KeyPadEquals
    toEnum 104 = KeyBackquote
    toEnum 105 = KeySemicolon2
    toEnum 106 = KeyCommand
    toEnum 107 = KeyUnknown
    toEnum x | x > 107 && x < 215 = KeyOther x
    toEnum 215 = KeyLshift
    toEnum 216 = KeyRshift
    toEnum 217 = KeyLctrl
    toEnum 218 = KeyRctrl
    toEnum 219 = KeyAlt
    toEnum 220 = KeyAltgr
    toEnum 221 = KeyLwin
    toEnum 222 = KeyRwin
    toEnum 223 = KeyMenu
    toEnum 224 = KeyScrolllock
    toEnum 225 = KeyNumlock
    toEnum 226 = KeyCapslock
    toEnum _   = error "Key.toEnum: bad argument"

    enumFrom x = enumFromTo x maxBound
    enumFromThen x y = enumFromThenTo x y maxBound

data Keymod
    = KeymodShift
    | KeymodCtrl
    | KeymodAlt
    | KeymodLwin
    | KeymodRwin
    | KeymodMenu
    | KeymodAltgr
    | KeymodCommand
    | KeymodScrolllock
    | KeymodNumlock
    | KeymodCapslock
    | KeymodInaltseq
    | KeymodAccent1
    | KeymodAccent2
    | KeymodAccent3
    | KeymodAccent4
      deriving (Show, Eq, Ord, Read)

instance Bounded Keymod where
    minBound = KeymodShift
    maxBound = KeymodAccent4

instance Enum Keymod where
    toEnum 0x00001 = KeymodShift
    toEnum 0x00002 = KeymodCtrl
    toEnum 0x00004 = KeymodAlt
    toEnum 0x00008 = KeymodLwin
    toEnum 0x00010 = KeymodRwin
    toEnum 0x00020 = KeymodMenu
    toEnum 0x00040 = KeymodAltgr
    toEnum 0x00080 = KeymodCommand
    toEnum 0x00100 = KeymodScrolllock
    toEnum 0x00200 = KeymodNumlock
    toEnum 0x00400 = KeymodCapslock
    toEnum 0x00800 = KeymodInaltseq
    toEnum 0x01000 = KeymodAccent1
    toEnum 0x02000 = KeymodAccent2
    toEnum 0x04000 = KeymodAccent3
    toEnum 0x08000 = KeymodAccent4
    toEnum _       = error "Keymod.toEnum: bad argument"
    fromEnum KeymodShift      = 0x00001
    fromEnum KeymodCtrl       = 0x00002
    fromEnum KeymodAlt        = 0x00004
    fromEnum KeymodLwin       = 0x00008
    fromEnum KeymodRwin       = 0x00010
    fromEnum KeymodMenu       = 0x00020
    fromEnum KeymodAltgr      = 0x00040
    fromEnum KeymodCommand    = 0x00080
    fromEnum KeymodScrolllock = 0x00100
    fromEnum KeymodNumlock    = 0x00200
    fromEnum KeymodCapslock   = 0x00400
    fromEnum KeymodInaltseq   = 0x00800
    fromEnum KeymodAccent1    = 0x01000
    fromEnum KeymodAccent2    = 0x02000
    fromEnum KeymodAccent3    = 0x04000
    fromEnum KeymodAccent4    = 0x08000

    succ x = toEnum (fromEnum x * 2)
    pred x = toEnum (fromEnum x `div` 2)

    enumFrom     x   = enumFromTo x maxBound
    enumFromTo x y | x > y = []
                   | x == y = [y]
                   | otherwise = x : enumFromTo (succ x) y
