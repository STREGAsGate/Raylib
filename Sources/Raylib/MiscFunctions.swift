/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import _RaylibC

public extension Raylib {
    //MARK: - Misc. functions
    
    /// Returns a random value between min and max (both included)
    @_transparent @available(*, deprecated, message: "Use `Int32.random(in range:)`")
    static func getRandomValue(_ min: Int32, _ max: Int32) -> Int32 {
        return _RaylibC.GetRandomValue(min, max)
    }
    
    /// Takes a screenshot of current screen (filename extension defines format)
    @_transparent
    static func takeScreenshot(_ fileName: String) {
        return fileName.withCString { cString in
            _RaylibC.TakeScreenshot(cString)
        }
    }
    
    /// Setup init configuration flags (view FLAGS)
    @_transparent
    static func setConfigFlags(_ flags: ConfigFlags) {
        _RaylibC.SetConfigFlags(flags.rawValue)
    }
    
    /// Set the current threshold (minimum) log level
    @_transparent
    static func setTraceLogLevel(_ logLevel: TraceLogLevel) {
        _RaylibC.SetTraceLogLevel(logLevel.rawValue)
    }
    
    /// Internal memory allocator
    @_transparent @available(*, deprecated, message: "Manipulating memory is not recommended in Swift.")
    static func memAlloc(_ size: Int32) -> UnsafeMutableRawPointer! {
        return _RaylibC.MemAlloc(size)
    }
    
    /// Internal memory reallocator
    @_transparent @available(*, deprecated, message: "Manipulating memory is not recommended in Swift.")
    static func nemRealloc(_ ptr: UnsafeMutableRawPointer!, _ size: Int32) -> UnsafeMutableRawPointer! {
        return _RaylibC.MemRealloc(ptr, size)
    }
    
    /// Internal memory free
    @_transparent @available(*, deprecated, message: "Manipulating memory is not recommended in Swift.")
    static func memFree(_ ptr: UnsafeMutableRawPointer!) {
        _RaylibC.MemFree(ptr)
    }
}
