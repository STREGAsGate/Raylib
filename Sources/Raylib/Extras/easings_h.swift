/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

//------------------------------------------------------------------------------------
// Useful easing functions for values animation (Module: easings)
//------------------------------------------------------------------------------------

/**
 *   How to use:
 *   The four inputs t,b,c,d are defined as follows:
 *   t = current time (in any unit measure, but same unit as duration)
 *   b = starting value to interpolate
 *   c = the total change in value of b that needs to occur
 *   d = total time it should take to complete (duration)
 */

import _RaylibC

//MARK: Module Functions Definition - Easings
extension Raylib {
    
    //MARK: Linear Easing None function
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeLinearNone(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseLinearNone(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeLinearIn(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseLinearIn(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeLinearOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseLinearOut(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeLinearInOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseLinearInOut(t, b, c, d)
    }
    
    //MARK: Sine Easing functions
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeSineIn(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseSineIn(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeSineOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseSineOut(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeSineInOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseSineInOut(t, b, c, d)
    }
    
    //MARK: Circular Easing functions
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeCircIn(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseCircIn(t, b, c, d)
    }
    
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeCircOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseCircOut(t, b, c, d)
    }
    
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeCircInOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseCircInOut(t, b, c, d)
    }
    
    //MARK: Cubic Easing functions
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeCubicIn(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseCubicIn(t, b, c, d)
    }
    
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeCubicOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseCubicOut(t, b, c, d)
    }
    
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeCubicInOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseCubicInOut(t, b, c, d)
    }
    
    //MARK: Quadratic Easing functions
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeQuadIn(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseQuadIn(t, b, c, d)
    }
    
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeQuadOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseQuadOut(t, b, c, d)
    }
    
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeQuadInOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseQuadInOut(t, b, c, d)
    }
    
    //MARK: Exponential Easing functions
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeExpoIn(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseExpoIn(t, b, c, d)
    }
    
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeExpoOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseExpoOut(t, b, c, d)
    }
    
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeExpoInOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseExpoInOut(t, b, c, d)
    }
    
    //MARK: Back Easing functions
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeBackIn(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseBackIn(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeBackOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseBackOut(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeBackInOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseBackInOut(t, b, c, d)
    }
    
    //MARK: Bounce Easing functions
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeBounceIn(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseBounceIn(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeBounceOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseBounceOut(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeBounceInOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseBounceInOut(t, b, c, d)
    }
    
    //MARK: Elastic Easing functions
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeElasticIn(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseElasticIn(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeElasticOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseElasticOut(t, b, c, d)
    }
    
    /**
     - parameter t: current time (in any unit measure, but same unit as duration)
     - parameter b: starting value to interpolate
     - parameter c: the total change in value of b that needs to occur
     - parameter d: total time it should take to complete (duration)
     */
    @inlinable
    public static func easeElasticInOut(_ t: Float, _ b: Float, _ c: Float, _ d: Float) -> Float {
        return _RaylibC.EaseElasticInOut(t, b, c, d)
    }
}