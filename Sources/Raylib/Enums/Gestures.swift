/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Gestures
// NOTE: It could be used as flags to enable only some gestures
public struct Gestures: OptionSet, Equatable, RawRepresentable {
    public let rawValue: Int32
    
    public static let none          = Gestures(0)
    public static let tap           = Gestures(1)
    public static let doubletap     = Gestures(2)
    public static let hold          = Gestures(4)
    public static let drag          = Gestures(8)
    public static let swipeRight    = Gestures(16)
    public static let swipeLeft     = Gestures(32)
    public static let swipeUp       = Gestures(64)
    public static let swipeDown     = Gestures(128)
    public static let pinchIn       = Gestures(256)
    public static let pinchOut      = Gestures(512)
    
    public init(_ rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
}
