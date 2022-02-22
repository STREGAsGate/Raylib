/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
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
    case number0        = 48
    case number1        = 49
    case number2        = 50
    case number3        = 51
    case number4        = 52
    case number5        = 53
    case number6        = 54
    case number7        = 55
    case number8        = 56
    case number9        = 57
    case semicolon      = 59
    case equal          = 61
    case letterA        = 65
    case letterB        = 66
    case letterC        = 67
    case letterD        = 68
    case letterE        = 69
    case letterF        = 70
    case letterG        = 71
    case letterH        = 72
    case letterI        = 73
    case letterJ        = 74
    case letterK        = 75
    case letterL        = 76
    case letterM        = 77
    case letterN        = 78
    case letterO        = 79
    case letterP        = 80
    case letterQ        = 81
    case letterR        = 82
    case letterS        = 83
    case letterT        = 84
    case letterU        = 85
    case letterV        = 86
    case letterW        = 87
    case letterX        = 88
    case letterY        = 89
    case letterZ        = 90
    
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
    case function1      = 290
    case function2      = 291
    case function3      = 292
    case function4      = 293
    case function5      = 294
    case function6      = 295
    case function7      = 296
    case function8      = 297
    case function9      = 298
    case function10     = 299
    case function11     = 300
    case function12     = 301
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
    var androidBack: RawValue {return 4}
    var androidMenu: RawValue {return 82}
    var androidVolumeUp: RawValue {return 24}
    var androidVolumeDown: RawValue {return 25}
    
    case unknown = -1
}

//MARK: - Deprecated
public extension KeyboardKey {
    @available(*, deprecated, renamed: "number0")
    static let zero: KeyboardKey = .number0
    @available(*, deprecated, renamed: "number1")
    static let one: KeyboardKey = .number1
    @available(*, deprecated, renamed: "number2")
    static let two: KeyboardKey = .number2
    @available(*, deprecated, renamed: "number3")
    static let three: KeyboardKey = .number3
    @available(*, deprecated, renamed: "number4")
    static let four: KeyboardKey = .number4
    @available(*, deprecated, renamed: "number5")
    static let five: KeyboardKey = .number5
    @available(*, deprecated, renamed: "number6")
    static let six: KeyboardKey = .number6
    @available(*, deprecated, renamed: "number7")
    static let seven: KeyboardKey = .number7
    @available(*, deprecated, renamed: "number8")
    static let eight: KeyboardKey = .number8
    @available(*, deprecated, renamed: "number9")
    static let nine: KeyboardKey = .number9
    
    @available(*, deprecated, renamed: "letterA")
    static let a: KeyboardKey = .letterA
    @available(*, deprecated, renamed: "letterB")
    static let b: KeyboardKey = .letterB
    @available(*, deprecated, renamed: "letterC")
    static let c: KeyboardKey = .letterC
    @available(*, deprecated, renamed: "letterD")
    static let d: KeyboardKey = .letterD
    @available(*, deprecated, renamed: "letterE")
    static let e: KeyboardKey = .letterE
    @available(*, deprecated, renamed: "letterF")
    static let f: KeyboardKey = .letterF
    @available(*, deprecated, renamed: "letterG")
    static let g: KeyboardKey = .letterG
    @available(*, deprecated, renamed: "letterH")
    static let h: KeyboardKey = .letterH
    @available(*, deprecated, renamed: "letterI")
    static let i: KeyboardKey = .letterI
    @available(*, deprecated, renamed: "letterJ")
    static let j: KeyboardKey = .letterJ
    @available(*, deprecated, renamed: "letterK")
    static let k: KeyboardKey = .letterK
    @available(*, deprecated, renamed: "letterL")
    static let l: KeyboardKey = .letterL
    @available(*, deprecated, renamed: "letterM")
    static let m: KeyboardKey = .letterM
    @available(*, deprecated, renamed: "letterN")
    static let n: KeyboardKey = .letterN
    @available(*, deprecated, renamed: "letterO")
    static let o: KeyboardKey = .letterO
    @available(*, deprecated, renamed: "letterP")
    static let p: KeyboardKey = .letterP
    @available(*, deprecated, renamed: "letterQ")
    static let q: KeyboardKey = .letterQ
    @available(*, deprecated, renamed: "letterR")
    static let r: KeyboardKey = .letterR
    @available(*, deprecated, renamed: "letterS")
    static let s: KeyboardKey = .letterS
    @available(*, deprecated, renamed: "letterT")
    static let t: KeyboardKey = .letterT
    @available(*, deprecated, renamed: "letterU")
    static let u: KeyboardKey = .letterU
    @available(*, deprecated, renamed: "letterV")
    static let v: KeyboardKey = .letterV
    @available(*, deprecated, renamed: "letterW")
    static let w: KeyboardKey = .letterW
    @available(*, deprecated, renamed: "letterX")
    static let x: KeyboardKey = .letterX
    @available(*, deprecated, renamed: "letterY")
    static let y: KeyboardKey = .letterY
    @available(*, deprecated, renamed: "letterZ")
    static let z: KeyboardKey = .letterZ
    
    @available(*, deprecated, renamed: "function1")
    static let f1: KeyboardKey = .function1
    @available(*, deprecated, renamed: "function2")
    static let f2: KeyboardKey = .function2
    @available(*, deprecated, renamed: "function3")
    static let f3: KeyboardKey = .function3
    @available(*, deprecated, renamed: "function4")
    static let f4: KeyboardKey = .function4
    @available(*, deprecated, renamed: "function5")
    static let f5: KeyboardKey = .function5
    @available(*, deprecated, renamed: "function6")
    static let f6: KeyboardKey = .function6
    @available(*, deprecated, renamed: "function7")
    static let f7: KeyboardKey = .function7
    @available(*, deprecated, renamed: "function8")
    static let f8: KeyboardKey = .function8
    @available(*, deprecated, renamed: "function9")
    static let f9: KeyboardKey = .function9
    @available(*, deprecated, renamed: "function10")
    static let f10: KeyboardKey = .function10
    @available(*, deprecated, renamed: "function11")
    static let f11: KeyboardKey = .function11
    @available(*, deprecated, renamed: "function12")
    static let f12: KeyboardKey = .function12
}
