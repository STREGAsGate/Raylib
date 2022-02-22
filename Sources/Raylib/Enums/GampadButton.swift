/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Gamepad buttons
public enum GamepadButton: Int32 {
    /// Unknown button, just for error checking
    case unknown
    /// Gamepad left DPAD up button
    case leftFaceUp
    /// Gamepad left DPAD right button
    case leftFaceRight
    /// Gamepad left DPAD down button
    case leftFaceDown
    /// Gamepad left DPAD left button
    case leftFaceLeft
    /// Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
    case rightFaceUp
    /// Gamepad right button right (i.e. PS3: Square, Xbox: X)
    case rightFaceRight
    /// Gamepad right button down (i.e. PS3: Cross, Xbox: A)
    case rightFaceDown
    /// Gamepad right button left (i.e. PS3: Circle, Xbox: B)
    case rightFaceLeft
    /// Gamepad top/back trigger left (first), it could be a trailing button
    case leftTrigger1
    /// Gamepad top/back trigger left (second), it could be a trailing button
    case leftTrigger2
    /// Gamepad top/back trigger right (one), it could be a trailing button
    case rightTrigger1
    /// Gamepad top/back trigger right (second), it could be a trailing button
    case rightTrigger2
    /// Gamepad center buttons, left one (i.e. PS3: Select)
    case middleLeft
    /// Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
    case middle
    /// Gamepad center buttons, right one (i.e. PS3: Start)
    case middleRight
    /// Gamepad joystick pressed button left
    case leftThumb
    /// Gamepad joystick pressed button right
    case rightThumb
}
