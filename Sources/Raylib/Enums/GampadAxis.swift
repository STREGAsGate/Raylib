/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Gamepad axis
public enum GamepadAxis: Int32 {
    /// Gamepad left stick X axis
    case leftX  = 0
    /// Gamepad left stick Y axis
    case leftY  = 1
    /// Gamepad right stick X axis
    case rightX = 2
    /// Gamepad right stick Y axis
    case rightY = 3
    /// Gamepad back trigger left, pressure level: [1..-1]
    case leftTrigger = 4
    /// Gamepad back trigger right, pressure level: [1..-1]
    case rightTrigger = 5
}
