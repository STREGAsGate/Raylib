/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import RaylibC

//------------------------------------------------------------------------------------
// Gestures and Touch Handling Functions (Module: gestures)
//------------------------------------------------------------------------------------
public extension Raylib {
    /// Enable a set of gestures using flags
    @inlinable
    static func setGesturesEnabled(_ flags: Gestures) {
        RaylibC.SetGesturesEnabled(UInt32(flags.rawValue))
    }
    
    /// Check if a gesture have been detected
    @inlinable
    static func isGestureDetected(_ gesture: Gestures) -> Bool {
        let result = RaylibC.IsGestureDetected(gesture.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get latest detected gesture
    @inlinable
    static func getGestureDetected() -> Gestures {
        return Gestures(rawValue: RaylibC.GetGestureDetected())
    }

    /// Get gesture hold time in milliseconds
    @inlinable
    static func getGestureHoldDuration() -> Float {
        return RaylibC.GetGestureHoldDuration()
    }
    
    /// Get gesture drag vector
    @inlinable
    static func getGestureDragVector() -> Vector2 {
        return RaylibC.GetGestureDragVector()
    }
    
    /// Get gesture drag angle
    @inlinable
    static func getGestureDragAngle() -> Float {
        return RaylibC.GetGestureDragAngle()
    }
    
    /// Get gesture pinch delta
    @inlinable
    static func getGesturePinchVector() -> Vector2 {
        return RaylibC.GetGesturePinchVector()
    }
    
    /// Get gesture pinch angle
    @inlinable
    static func getGesturePinchAngle() -> Float {
        return RaylibC.GetGesturePinchAngle()
    }
}
