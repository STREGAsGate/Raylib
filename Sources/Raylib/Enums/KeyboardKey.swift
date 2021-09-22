/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Keyboard keys (US keyboard layout)
// NOTE: Use GetKeyPressed() to allow redefining
// required keys for alternative layouts
public enum KeyboardKey: Int32 {
    case null           = 0
    // Alphanumeric keys
    case apostrophe     = 39
    case comma          = 44
    case minus          = 45
    case period         = 46
    case slash          = 47
    case zero           = 48
    case one            = 49
    case two            = 50
    case three          = 51
    case four           = 52
    case five           = 53
    case six            = 54
    case seven          = 55
    case eight          = 56
    case nine           = 57
    case semicolon      = 59
    case equal          = 61
    case a              = 65
    case b              = 66
    case c              = 67
    case d              = 68
    case e              = 69
    case f              = 70
    case g              = 71
    case h              = 72
    case i              = 73
    case j              = 74
    case k              = 75
    case l              = 76
    case m              = 77
    case n              = 78
    case o              = 79
    case p              = 80
    case q              = 81
    case r              = 82
    case s              = 83
    case t              = 84
    case u              = 85
    case v              = 86
    case w              = 87
    case x              = 88
    case y              = 89
    case z              = 90
    
    // Function keys
    case space          = 32
    case escape         = 256
    case enter          = 257
    case tab            = 258
    case backspace      = 259
    case insert         = 260
    case delete         = 261
    case right          = 262
    case left           = 263
    case down           = 264
    case up             = 265
    case pageUp         = 266
    case pageDown       = 267
    case home           = 268
    case end            = 269
    case capsLock       = 280
    case scrollLock     = 281
    case numLock        = 282
    case printScreen    = 283
    case pause          = 284
    case f1             = 290
    case f2             = 291
    case f3             = 292
    case f4             = 293
    case f5             = 294
    case f6             = 295
    case f7             = 296
    case f8             = 297
    case f9             = 298
    case f10            = 299
    case f11            = 300
    case f12            = 301
    case leftShift      = 340
    case leftControl    = 341
    case leftAlt        = 342
    case leftSuper      = 343
    case rightShift     = 344
    case rightControl   = 345
    case rightAlt       = 346
    case rightSuper     = 347
    case kbMenu         = 348
    case leftBracket    = 91
    case backslash      = 92
    case rightBracket   = 93
    case grave          = 96
    
    // Keypad keys
    case keypad0        = 320
    case keypad1        = 321
    case keypad2        = 322
    case keypad3        = 323
    case keypad4        = 324
    case keypad5        = 325
    case keypad6        = 326
    case keypad7        = 327
    case keypad8        = 328
    case keypad9        = 329
    case keypadDecimal  = 330
    case keypadDivide   = 331
    case keypadMultiply = 332
    case keypadSubtract = 333
    case keypadAdd      = 334
    case keypadEnter    = 335
    case keypadEqual    = 336
    
    // Android key buttons
//    case back           = 4
//    case menu           = 82
//    case volumeUp       = 24
//    case volumeDown     = 25

    case unknown = -1
}
