/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Mouse buttons
public enum MouseCursor: Int32 {
    case `default`      = 0
    case arrow          = 1
    case ibeam          = 2
    case crosshair      = 3
    case pointingHand   = 4
    /// The horizontal resize/move arrow shape
    case resizeEW       = 5
    /// The vertical resize/move arrow shape
    case resizeNS       = 6
    /// The top-left to bottom-right diagonal resize/move arrow shape
    case resizeNWSE     = 7
    /// The top-right to bottom-left diagonal resize/move arrow shape
    case resizeNESW     = 8
         /// The omni-directional resize/move cursor shape
    case resizeAll      = 9
         /// The operation-not-allowed shape
    case notAllowed     = 10
}
