/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Raylib {
    //MARK: - Callbacks to hook some internal functions
    // WARNING: This callbacks are intended for advance users
//    typealias TraceLogCallback = @convention(c) Int32, UnsafePointer<CChar>?, CVaListPointer?) -> Void // Logging: Redirect trace log messages
    typealias LoadFileDataCallback = @convention(c) (UnsafePointer<CChar>?, UnsafeMutablePointer<UInt32>?) -> UnsafeMutablePointer<UInt8>? // FileIO: Load binary data
    @available(Windows, unavailable, message: "Can't be represented in Swift.")
//    typealias SaveFileDataCallback = @convention(c) (UnsafePointer<CChar>?, UnsafeMutableRawPointer?, UInt32) -> Bool // FileIO: Save binary data
    typealias LoadFileTextCallback = @convention(c) (UnsafePointer<CChar>?) -> UnsafeMutablePointer<CChar>? // FileIO: Load text data
    @available(Windows, unavailable, message: "Can't be represented in Swift.")
//    typealias SaveFileTextCallback = @convention(c) (UnsafePointer<CChar>?, UnsafeMutablePointer<CChar>?) -> Bool // FileIO: Save text data
    
    //MARK: - Set custom callbacks
    // WARNING: Callbacks setup is intended for advance users
    
    /// Set custom trace log
    @_transparent @available(*, unavailable, message: "Can't be represented in Swift.")
    static func setTraceLogCallback(_ callback: Any) {
        //    _RaylibC.SetTraceLogCallback(callback)
    }
    
    /// Set custom file binary data loader
    @_transparent
    static func setLoadFileDataCallback(_ callback: LoadFileDataCallback!) {
        _RaylibC.SetLoadFileDataCallback(callback)
    }
    
    /// Set custom file binary data saver
    @_transparent @available(*, unavailable, message: "Can't be represented in Swift.")
    static func setSaveFileDataCallback(_ callback: Any) {
//        _RaylibC.SetSaveFileDataCallback(callback)
    }
    
    /// Set custom file text data loader
    @_transparent @available(*, unavailable, message: "Can't be represented in Swift.")
    static func setLoadFileTextCallback(_ callback: Any) {
//        _RaylibC.SetLoadFileTextCallback(callback)
    }
    
    /// Set custom file text data saver
    @_transparent
    static func setSaveFileTextCallback(_ callback: SaveFileTextCallback!) {
        _RaylibC.SetSaveFileTextCallback(callback)
    }
}
