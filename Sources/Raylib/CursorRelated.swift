/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import _RaylibC

public extension Raylib {
    //MARK: - Cursor-related functions
    
    /// Shows cursor
    @_transparent
    static func showCursor() {
        _RaylibC.ShowCursor()
    }
    
    /// Hides cursor
    @_transparent
    static func hideCursor() {
        _RaylibC.HideCursor()
    }
    
    /// Check if cursor is not visible
    @_transparent
    static var isCursorHidden: Bool {
        let result = _RaylibC.IsCursorHidden()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Enables cursor (unlock cursor)
    @_transparent
    static func enableCursor() {
        _RaylibC.EnableCursor()
    }
    
    /// Disables cursor (lock cursor)
    @_transparent
    static func disableCursor() {
        _RaylibC.DisableCursor()
    }
    
    /// Check if cursor is on the current screen.
    @_transparent
    static var isCursorOnScreen: Bool {
        let result = _RaylibC.IsCursorOnScreen()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
}
