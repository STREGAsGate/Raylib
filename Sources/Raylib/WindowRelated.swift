/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Raylib {
    // Window-related functions
    /// Initialize window and OpenGL context
    @_transparent
    static func initWindow(_ width: Int32, _ height: Int32, _ title: String) {
        title.withCString { title in
            _RaylibC.InitWindow(width, height, title)
        }
    }
    
    /// Check if KEY_ESCAPE pressed or Close icon pressed
    @_transparent
    static var windowShouldClose: Bool {
        let result = _RaylibC.WindowShouldClose()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Close window and unload OpenGL context
    @_transparent
    static func closeWindow() {
        _RaylibC.CloseWindow()
    }
    
    /// Check if window has been initialized successfully
    @_transparent
    static var isWindowReady: Bool {
        let result = _RaylibC.IsWindowReady()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently fullscreen
    @_transparent
    static var isWindowFullscreen: Bool {
        let result = _RaylibC.IsWindowFullscreen()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently hidden (only PLATFORM_DESKTOP)
    @_transparent
    static var isWindowHidden: Bool {
        let result = _RaylibC.IsWindowHidden()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently minimized (only PLATFORM_DESKTOP)
    @_transparent
    static var isWindowMinimized: Bool {
        let result = _RaylibC.IsWindowMinimized()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently maximized (only PLATFORM_DESKTOP)
    @_transparent
    static var isWindowMaximized: Bool {
        let result = _RaylibC.IsWindowMaximized()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently focused (only PLATFORM_DESKTOP)
    @_transparent
    static var isWindowFocused: Bool {
        let result = _RaylibC.IsWindowFocused()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window has been resized last frame
    @_transparent
    static var isWindowResized: Bool {
        let result = _RaylibC.IsWindowResized()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if one specific window flag is enabled
    @_transparent
    static func isWindowState(_ flag: ConfigFlags) -> Bool {
        let result = _RaylibC.IsWindowState(flag.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set window configuration state using flags
    @_transparent
    static func setWindowState(_ flags: ConfigFlags) {
        _RaylibC.SetWindowState(flags.rawValue)
    }
    
    /// Clear window configuration state flags
    @_transparent
    static func clearWindowState(_ flags: ConfigFlags) {
        _RaylibC.ClearWindowState(flags.rawValue)
    }
    
    /// Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
    @_transparent
    static func toggleFullscreen() {
        _RaylibC.ToggleFullscreen()
    }
    
    /// Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
    @_transparent
    static func maximizeWindow() {
        _RaylibC.MaximizeWindow()
    }
    
    /// Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
    @_transparent
    static func minimizeWindow() {
        _RaylibC.MinimizeWindow()
    }
    
    /// Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
    @_transparent
    static func restoreWindow() {
        _RaylibC.RestoreWindow()
    }
    
    /// Set icon for window (only PLATFORM_DESKTOP)
    @_transparent
    static func setWindowIcon(_ image: Image) {
        _RaylibC.SetWindowIcon(image)
    }
    
    /// Set title for window (only PLATFORM_DESKTOP)
    @_transparent
    static func setWindowTitle(_ title: String) {
        title.withCString { title in
            _RaylibC.SetWindowTitle(title)
        }
    }
    
    /// Set window position on screen (only PLATFORM_DESKTOP)
    @_transparent
    static func setWindowPosition(_ x: Int32, _ y: Int32) {
        _RaylibC.SetWindowPosition(x, y)
    }
    
    /// Set monitor for the current window (fullscreen mode)
    @_transparent
    static func setWindowMonitor(_ monitor: Int32) {
        _RaylibC.SetWindowMonitor(monitor)
    }
    
    /// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
    @_transparent
    static func setWindowMinSize(_ width: Int32, _ height: Int32) {
        _RaylibC.SetWindowMinSize(width, height)
    }
    
    /// Set window dimensions
    @_transparent
    static func setWindowSize(_ width: Int32, _ height: Int32) {
        _RaylibC.SetWindowSize(width, height)
    }
    
    /// Get native window handle
    @_transparent
    static func getWindowHandle() -> UnsafeMutableRawPointer! {
        return _RaylibC.GetWindowHandle()
    }
    
    /// Get current screen width
    @_transparent
    static func getScreenWidth() -> Int32 {
        return _RaylibC.GetScreenWidth()
    }
    
    /// Get current screen height
    @_transparent
    static func getScreenHeight() -> Int32 {
        return _RaylibC.GetScreenHeight()
    }
    
    /// Get number of connected monitors
    @_transparent
    static func getMonitorCount() -> Int32 {
        return _RaylibC.GetMonitorCount()
    }
    
    /// Get current connected monitor
    @_transparent
    static func getCurrentMonitor() -> Int32 {
        return _RaylibC.GetCurrentMonitor()
    }
    
    /// Get specified monitor position
    @_transparent
    static func getMonitorPosition(_ monitor: Int32) -> Vector2 {
        return _RaylibC.GetMonitorPosition(monitor)
    }
    
    /// Get specified monitor width (max available by monitor)
    @_transparent
    static func getMonitorWidth(_ monitor: Int32) -> Int32 {
        return _RaylibC.GetMonitorWidth(monitor)
    }
    
    /// Get specified monitor height (max available by monitor)
    @_transparent
    static func getMonitorHeight(_ monitor: Int32) -> Int32 {
        return _RaylibC.GetMonitorHeight(monitor)
    }
    
    /// Get specified monitor physical width in millimetres
    @_transparent
    static func getMonitorPhysicalWidth(_ monitor: Int32) -> Int32 {
        return _RaylibC.GetMonitorPhysicalWidth(monitor)
    }
    
    /// Get specified monitor physical height in millimetres
    @_transparent
    static func getMonitorPhysicalHeight(_ monitor: Int32) -> Int32 {
        return _RaylibC.GetMonitorPhysicalHeight(monitor)
    }
    
    /// Get specified monitor refresh rate
    @_transparent
    static func getMonitorRefreshRate(_ monitor: Int32) -> Int32 {
        return _RaylibC.GetMonitorRefreshRate(monitor)
    }
    
    /// Get window position XY on monitor
    @_transparent
    static func getWindowPosition() -> Vector2 {
        return _RaylibC.GetWindowPosition()
    }
    
    /// Get window scale DPI factor
    @_transparent
    static func getWindowScaleDPI() -> Vector2 {
        return _RaylibC.GetWindowScaleDPI()
    }
    
    /// Get the human-readable, UTF-8 encoded name of the primary monitor
    @_transparent
    static func getMonitorName(_ monitor: Int32) -> String {
        return String(cString: _RaylibC.GetMonitorName(monitor))
    }
    
    /// Set clipboard text content
    @_transparent
    static func setClipboardText(_ text: String) {
        _RaylibC.SetClipboardText(text)
    }
    
    /// Get clipboard text content
    @_transparent
    static func getClipboardText() -> String {
        return String(cString: _RaylibC.GetClipboardText())
    }
}
