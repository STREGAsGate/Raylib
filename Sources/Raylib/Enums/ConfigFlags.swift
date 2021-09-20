/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

// System/Window config flags
// NOTE: Every bit registers one state (use it with bit masks)
// By default all flags are set to 0
public struct ConfigFlags: OptionSet, Equatable, RawRepresentable {
    public let rawValue: UInt32
    
    /// Set to try enabling V-Sync on GPU
    static let vsyncHint                = ConfigFlags(0x00000040)
    /// Set to run program in fullscreen
    static let fullscreenMode           = ConfigFlags(0x00000002)
    /// Set to allow resizable window
    static let windowResizable          = ConfigFlags(0x00000004)
    /// Set to disable window decoration (frame and buttons)
    static let windowUndecorated        = ConfigFlags(0x00000008)
    /// Set to hide window
    static let windowsHidden            = ConfigFlags(0x00000080)
    /// Set to minimize window (iconify)
    static let windowMinimized          = ConfigFlags(0x00000200)
    /// Set to maximize window (expanded to monitor)
    static let windowMaximized          = ConfigFlags(0x00000400)
    /// Set to window non focused
    static let windowUnfocused          = ConfigFlags(0x00000800)
    /// Set to window always on top
    static let windowTopmost            = ConfigFlags(0x00001000)
    /// Set to allow windows running while minimized
    static let windowAlwaysRun          = ConfigFlags(0x00000100)
    /// Set to allow transparent framebuffer
    static let windowTransparent        = ConfigFlags(0x00000010)
    /// Set to support HighDPI
    static let windowHighDPI            = ConfigFlags(0x00002000)
    /// Set to try enabling MSAA 4X
    static let Fmsaa4xHint              = ConfigFlags(0x00000020)
    /// Set to try enabling interlaced video format (for V3D)
    static let interlacedHint           = ConfigFlags(0x00010000)
    
    public init(_ rawValue: UInt32) {
        self.rawValue = rawValue
    }
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
}
