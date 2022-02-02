/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Raylib {
    //------------------------------------------------------------------------------------
    // Gestures and Touch Handling Functions (Module: gestures)
    //------------------------------------------------------------------------------------
    
    
    /// Enable a set of gestures using flags
    @_transparent
    static func setGesturesEnabled(_ flags: Gestures) {
        _RaylibC.SetGesturesEnabled(UInt32(flags.rawValue))
    }
    
    /// Check if a gesture have been detected
    @_transparent
    static func isGestureDetected(_ gesture: Gestures) -> Bool {
        let result = _RaylibC.IsGestureDetected(gesture.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get latest detected gesture
    @_transparent
    static func getGestureDetected() -> Gestures {
        return Gestures(rawValue: _RaylibC.GetGestureDetected())
    }
        
    /// Get gesture hold time in milliseconds
    @_transparent
    static func getGestureHoldDuration() -> Float {
        return _RaylibC.GetGestureHoldDuration()
    }
    
    /// Get gesture drag vector
    @_transparent
    static func getGestureDragVector() -> Vector2 {
        return _RaylibC.GetGestureDragVector()
    }
    
    /// Get gesture drag angle
    @_transparent
    static func getGestureDragAngle() -> Float {
        return _RaylibC.GetGestureDragAngle()
    }
    
    /// Get gesture pinch delta
    @_transparent
    static func getGesturePinchVector() -> Vector2 {
        return _RaylibC.GetGesturePinchVector()
    }
    
    /// Get gesture pinch angle
    @_transparent
    static func getGesturePinchAngle() -> Float {
        return _RaylibC.GetGesturePinchAngle()
    }
}
