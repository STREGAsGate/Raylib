/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Gamepad buttons
public enum GamepadButton: Int32 {
    
    /// This is here just for error checking
    case unknown = 0
    
    // This is normally a DPAD
    case leftFaceUp
    case leftFaceRight
    case leftFaceDown
    case leftFaceLeft
    
    // This normally corresponds with PlayStation and Xbox controllers
    // XBOX: [Y,X,A,B]
    // PS3: [Triangle,Square,Cross,Circle]
    // No support for 6 button controllers though..
    case rightFaceUp
    case rightFaceRight
    case rightFaceDown
    case rightFaceLeft
    
    // Triggers
    case leftTrigger1
    case leftTrigger2
    case rightTrigger1
    case rightTrigger2
    
    // These are buttons in the center of the gamepad
    /// PS3 Select
    case middleLeft
    /// PS Button/XBOX Button
    case middle
    /// PS3 Start
    case middleRight
    
    // These are the joystick press in buttons
    case leftThumb
    case rightThumb
}
