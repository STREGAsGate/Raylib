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
    // Input Handling Functions (Module: core)
    //------------------------------------------------------------------------------------
    
    //MARK: - Input-related functions: keyboard
    
    /// Detect if a key has been pressed once
    @_transparent
    static func isKeyPressed(_ key: KeyboardKey) -> Bool {
        let result = _RaylibC.IsKeyPressed(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect if a key is being pressed
    @_transparent
    static func isKeyDown(_ key: KeyboardKey) -> Bool {
        let result = _RaylibC.IsKeyDown(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect if a key has been released once
    @_transparent
    static func isKeyReleased(_ key: KeyboardKey) -> Bool {
        let result = _RaylibC.IsKeyReleased(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect if a key is NOT being pressed
    @_transparent
    static func isKeyUp(_ key: KeyboardKey) -> Bool {
        let result = _RaylibC.IsKeyUp(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set a custom key to exit program (default is ESC)
    @_transparent
    static func setExitKey(_ key: KeyboardKey) {
        _RaylibC.SetExitKey(key.rawValue)
    }
    
    /// Get key pressed (keycode), call it multiple times for keys queued
    @_transparent
    static func getKeyPressed() -> KeyboardKey? {
        let result = _RaylibC.GetKeyPressed()
        guard let key = KeyboardKey(rawValue: result) else {print("Key code \(result) not member of `KeyboardKey`."); return nil}
        return key
    }
    
    /// Get char pressed (unicode), call it multiple times for chars queued
    @_transparent
    static func getCharPressed() -> Character? {
        let result = _RaylibC.GetCharPressed()
        guard let scalar = UnicodeScalar(UInt32(result)) else {return nil}
        return Character(scalar)
    }
    
    //MARK: - Input-related functions: gamepads
    
    /// Detect if a gamepad is available
    @_transparent
    static func isGamepadAvailable(_ gamepad: Int32) -> Bool {
        let result = _RaylibC.IsGamepadAvailable(gamepad)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
//    /// Check gamepad name (if available)
//    @_transparent
//    static func isGamepadName(_ gamepad: Int32, _ name: String) -> Bool {
//        return name.withCString { cString in
//            let result = _RaylibC.IsGamepadName(gamepad, cString)
//#if os(Windows)
//            return result.rawValue != 0
//#else
//            return result
//#endif
//        }
//    }
    
    /// Return gamepad internal name id
    @_transparent
    static func getGamepadName(_ gamepad: Int32) -> String {
        return String(cString: _RaylibC.GetGamepadName(gamepad))
    }
    
    /// Detect if a gamepad button has been pressed once
    @_transparent
    static func isGamepadButtonPressed(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = _RaylibC.IsGamepadButtonPressed(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect if a gamepad button is being pressed
    @_transparent
    static func isGamepadButtonDown(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = _RaylibC.IsGamepadButtonDown(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect if a gamepad button has been released once
    @_transparent
    static func isGamepadButtonReleased(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = _RaylibC.IsGamepadButtonReleased(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect if a gamepad button is NOT being pressed
    @_transparent
    static func isGamepadButtonUp(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = _RaylibC.IsGamepadButtonUp(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get the last gamepad button pressed
    @_transparent
    static func getGamepadButtonPressed() -> GamepadButton {
        return GamepadButton(rawValue: _RaylibC.GetGamepadButtonPressed()) ?? .unknown
    }
    
    /// Return gamepad axis count for a gamepad
    @_transparent
    static func getGamepadAxisCount(_ gamepad: Int32) -> Int32 {
        return _RaylibC.GetGamepadAxisCount(gamepad)
    }
    
    /// Return axis movement value for a gamepad axis
    @_transparent
    static func getGamepadAxisMovement(_ gamepad: Int32, _ axis: GamepadAxis) -> Float {
        return _RaylibC.GetGamepadAxisMovement(gamepad, axis.rawValue)
    }
    
    /// Set internal gamepad mappings (SDL_GameControllerDB)
    @_transparent
    static func setGamepadMappings(_ mappings: String) -> Bool {
        return mappings.withCString { cString in
            return _RaylibC.SetGamepadMappings(cString) != 0
        }
    }
    
    //MARK: - Input-related functions: mouse
    
    
    /// Detect if a mouse button has been pressed once
    @_transparent
    static func isMouseButtonPressed(_ button: MouseButton) -> Bool {
        let result = _RaylibC.IsMouseButtonPressed(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect if a mouse button is being pressed
    @_transparent
    static func isMouseButtonDown(_ button: MouseButton) -> Bool {
        let result = _RaylibC.IsMouseButtonDown(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect if a mouse button has been released once
    @_transparent
    static func isMouseButtonReleased(_ button: MouseButton) -> Bool {
        let result = _RaylibC.IsMouseButtonReleased(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect if a mouse button is NOT being pressed
    @_transparent
    static func isMouseButtonUp(_ button: MouseButton) -> Bool {
        let result = _RaylibC.IsMouseButtonUp(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Returns mouse position X
    @_transparent
    static func getMouseX() -> Int32 {
        return _RaylibC.GetMouseX()
    }
    
    /// Returns mouse position Y
    @_transparent
    static func getMouseY() -> Int32 {
        return _RaylibC.GetMouseY()
    }
    
    /// Returns mouse position XY
    @_transparent
    static func getMousePosition() -> Vector2 {
        return _RaylibC.GetMousePosition()
    }
    
    /// Set mouse position XY
    @_transparent
    static func setMousePosition(_ x: Int32, _ y: Int32) {
        _RaylibC.SetMousePosition(x, y)
    }
    
    /// Set mouse offset
    @_transparent
    static func setMouseOffset(_ offsetX: Int32, _ offsetY: Int32) {
        _RaylibC.SetMouseOffset(offsetX, offsetY)
    }
    
    /// Set mouse scaling
    @_transparent
    static func setMouseScale(_ scaleX: Float, _ scaleY: Float) {
        _RaylibC.SetMouseScale(scaleX, scaleY)
    }
    
    /// Returns mouse wheel movement Y
    @_transparent
    static func getMouseWheelMove() -> Float {
        return _RaylibC.GetMouseWheelMove()
    }
    
    /// Set mouse cursor
    @_transparent
    static func setMouseCursor(_ cursor: MouseCursor) {
        _RaylibC.SetMouseCursor(cursor.rawValue)
    }
    
    //MARK: - Input-related functions: touch
    
    /// Returns touch position X for touch point 0 (relative to screen size)
    @_transparent
    static func getTouchX() -> Int32 {
        return _RaylibC.GetTouchX()
    }
    
    /// Returns touch position Y for touch point 0 (relative to screen size)
    @_transparent
    static func getTouchY() -> Int32 {
        return _RaylibC.GetTouchY()
    }
    
    /// Returns touch position XY for a touch point index (relative to screen size)
    @_transparent
    static func getTouchPosition(_ index: Int32) -> Vector2 {
        return _RaylibC.GetTouchPosition(index)
    }
}
