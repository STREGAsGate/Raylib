/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import _RaylibC

public extension Raylib {
    // Timing-related functions
    
    /// Set target FPS (maximum)
    @_transparent
    static func setTargetFPS(_ fps: Int32) {
        _RaylibC.SetTargetFPS(fps)
    }
    
    /// Returns current FPS
    @_transparent
    static func getFPS() -> Int32 {
        return _RaylibC.GetFPS()
    }
    
    /// Returns time in seconds for last frame drawn (delta time)
    @_transparent
    static func getFrameTime() -> Float {
        return _RaylibC.GetFrameTime()
    }
    
    /// Returns elapsed time in seconds since InitWindow()
    @_transparent
    static func getTime() -> Double {
        return _RaylibC.GetTime()
    }
}
