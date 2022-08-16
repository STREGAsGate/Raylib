/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

//------------------------------------------------------------------------------------
// Window and Graphics Device Functions (Module: core)
//------------------------------------------------------------------------------------
//MARK: - Window-related functions
public extension Raylib {
    /// Initialize window and OpenGL context
    @inlinable
    static func initWindow(_ width: Int32, _ height: Int32, _ title: String) {
        title.withCString { title in
            _RaylibC.InitWindow(width, height, title)
        }
    }
    
    /// Check if KEY_ESCAPE pressed or Close icon pressed
    @inlinable
    static var windowShouldClose: Bool {
        let result = _RaylibC.WindowShouldClose()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Close window and unload OpenGL context
    @inlinable
    static func closeWindow() {
        _RaylibC.CloseWindow()
    }
    
    /// Check if window has been initialized successfully
    @inlinable
    static var isWindowReady: Bool {
        let result = _RaylibC.IsWindowReady()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently fullscreen
    @inlinable
    static var isWindowFullscreen: Bool {
        let result = _RaylibC.IsWindowFullscreen()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently hidden (only PLATFORM_DESKTOP)
    @inlinable
    static var isWindowHidden: Bool {
        let result = _RaylibC.IsWindowHidden()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently minimized (only PLATFORM_DESKTOP)
    @inlinable
    static var isWindowMinimized: Bool {
        let result = _RaylibC.IsWindowMinimized()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently maximized (only PLATFORM_DESKTOP)
    @inlinable
    static var isWindowMaximized: Bool {
        let result = _RaylibC.IsWindowMaximized()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently focused (only PLATFORM_DESKTOP)
    @inlinable
    static var isWindowFocused: Bool {
        let result = _RaylibC.IsWindowFocused()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window has been resized last frame
    @inlinable
    static var isWindowResized: Bool {
        let result = _RaylibC.IsWindowResized()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if one specific window flag is enabled
    @inlinable
    static func isWindowState(_ flag: ConfigFlags) -> Bool {
        let result = _RaylibC.IsWindowState(flag.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set window configuration state using flags
    @inlinable
    static func setWindowState(_ flags: ConfigFlags) {
        _RaylibC.SetWindowState(flags.rawValue)
    }
    
    /// Clear window configuration state flags
    @inlinable
    static func clearWindowState(_ flags: ConfigFlags) {
        _RaylibC.ClearWindowState(flags.rawValue)
    }
    
    /// Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
    @inlinable
    static func toggleFullscreen() {
        _RaylibC.ToggleFullscreen()
    }
    
    /// Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
    @inlinable
    static func maximizeWindow() {
        _RaylibC.MaximizeWindow()
    }
    
    /// Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
    @inlinable
    static func minimizeWindow() {
        _RaylibC.MinimizeWindow()
    }
    
    /// Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
    @inlinable
    static func restoreWindow() {
        _RaylibC.RestoreWindow()
    }
    
    /// Set icon for window (only PLATFORM_DESKTOP)
    @inlinable
    static func setWindowIcon(_ image: Image) {
        _RaylibC.SetWindowIcon(image)
    }
    
    /// Set title for window (only PLATFORM_DESKTOP)
    @inlinable
    static func setWindowTitle(_ title: String) {
        title.withCString { title in
            _RaylibC.SetWindowTitle(title)
        }
    }
    
    /// Set window position on screen (only PLATFORM_DESKTOP)
    @inlinable
    static func setWindowPosition(_ x: Int32, _ y: Int32) {
        _RaylibC.SetWindowPosition(x, y)
    }
    
    /// Set monitor for the current window (fullscreen mode)
    @inlinable
    static func setWindowMonitor(_ monitor: Int32) {
        _RaylibC.SetWindowMonitor(monitor)
    }
    
    /// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
    @inlinable
    static func setWindowMinSize(_ width: Int32, _ height: Int32) {
        _RaylibC.SetWindowMinSize(width, height)
    }
    
    /// Set window dimensions
    @inlinable
    static func setWindowSize(_ width: Int32, _ height: Int32) {
        _RaylibC.SetWindowSize(width, height)
    }
    
    /// Get native window handle
    @inlinable
    static func getWindowHandle() -> UnsafeMutableRawPointer! {
        return _RaylibC.GetWindowHandle()
    }
    
    /// Get current screen width
    @inlinable
    static func getScreenWidth() -> Int32 {
        return _RaylibC.GetScreenWidth()
    }
    
    /// Get current screen height
    @inlinable
    static func getScreenHeight() -> Int32 {
        return _RaylibC.GetScreenHeight()
    }
    
    /// Get number of connected monitors
    @inlinable
    static func getMonitorCount() -> Int32 {
        return _RaylibC.GetMonitorCount()
    }
    
    /// Get current connected monitor
    @inlinable
    static func getCurrentMonitor() -> Int32 {
        return _RaylibC.GetCurrentMonitor()
    }
    
    /// Get specified monitor position
    @inlinable
    static func getMonitorPosition(_ monitor: Int32) -> Vector2 {
        return _RaylibC.GetMonitorPosition(monitor)
    }
    
    /// Get specified monitor width (current video mode used by monitor)
    @inlinable
    static func getMonitorWidth(_ monitor: Int32) -> Int32 {
        return _RaylibC.GetMonitorWidth(monitor)
    }
    
    /// Get specified monitor height (current video mode used by monitor)
    @inlinable
    static func getMonitorHeight(_ monitor: Int32) -> Int32 {
        return _RaylibC.GetMonitorHeight(monitor)
    }
    
    /// Get specified monitor physical width in millimetres
    @inlinable
    static func getMonitorPhysicalWidth(_ monitor: Int32) -> Int32 {
        return _RaylibC.GetMonitorPhysicalWidth(monitor)
    }
    
    /// Get specified monitor physical height in millimetres
    @inlinable
    static func getMonitorPhysicalHeight(_ monitor: Int32) -> Int32 {
        return _RaylibC.GetMonitorPhysicalHeight(monitor)
    }
    
    /// Get specified monitor refresh rate
    @inlinable
    static func getMonitorRefreshRate(_ monitor: Int32) -> Int32 {
        return _RaylibC.GetMonitorRefreshRate(monitor)
    }
    
    /// Get window position XY on monitor
    @inlinable
    static func getWindowPosition() -> Vector2 {
        return _RaylibC.GetWindowPosition()
    }
    
    /// Get window scale DPI factor
    @inlinable
    static func getWindowScaleDPI() -> Vector2 {
        return _RaylibC.GetWindowScaleDPI()
    }
    
    /// Get the human-readable, UTF-8 encoded name of the primary monitor
    @inlinable
    static func getMonitorName(_ monitor: Int32) -> String {
        return String(cString: _RaylibC.GetMonitorName(monitor))
    }
    
    /// Set clipboard text content
    @inlinable
    static func setClipboardText(_ text: String) {
        _RaylibC.SetClipboardText(text)
    }
    
    /// Get clipboard text content
    @inlinable
    static func getClipboardText() -> String {
        return String(cString: _RaylibC.GetClipboardText())
    }
    
    /// Enable waiting for events on EndDrawing(), no automatic event polling
    @inlinable
    static func enableEventWaiting() {
        _RaylibC.EnableEventWaiting()
    }
    
    /// Disable waiting for events on EndDrawing(), automatic events polling
    @inlinable
    static func disableEventWaiting() {
        _RaylibC.DisableEventWaiting()
    }
}


//MARK: - Custom frame control functions
public extension Raylib {
    /// Swap back buffer with front buffer (screen drawing)
    /// - note: Those functions are intended for advance users that want full control over the frame processing
    ///         By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timming + PollInputEvents()
    ///         To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
    @inlinable
    static func swapScreenBuffer() {
        _RaylibC.SwapScreenBuffer()
    }
    
    /// Register all input events
    /// - note: Those functions are intended for advance users that want full control over the frame processing
    ///         By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timming + PollInputEvents()
    ///         To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
    @inlinable
    static func pollInputEvents() {
        _RaylibC.PollInputEvents()
    }
    
    /// Wait for some milliseconds (halt program execution)
    /// - note: Those functions are intended for advance users that want full control over the frame processing
    ///         By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timming + PollInputEvents()
    ///         To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
    @inlinable
    static func waitTime(_ ms: Double) {
        _RaylibC.WaitTime(ms)
    }
}


//MARK: - Cursor-related functions
public extension Raylib {
    /// Shows cursor
    @inlinable
    static func showCursor() {
        _RaylibC.ShowCursor()
    }
    
    /// Hides cursor
    @inlinable
    static func hideCursor() {
        _RaylibC.HideCursor()
    }
    
    /// Check if cursor is not visible
    @inlinable
    static var isCursorHidden: Bool {
        let result = _RaylibC.IsCursorHidden()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Enables cursor (unlock cursor)
    @inlinable
    static func enableCursor() {
        _RaylibC.EnableCursor()
    }
    
    /// Disables cursor (lock cursor)
    @inlinable
    static func disableCursor() {
        _RaylibC.DisableCursor()
    }
    
    /// Check if cursor is on the screen
    @inlinable
    static var isCursorOnScreen: Bool {
        let result = _RaylibC.IsCursorOnScreen()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
}


//MARK: - Drawing-related functions
public extension Raylib {
    /// Set background color (framebuffer clear color)
    @inlinable
    static func clearBackground(_ color: Color) {
        _RaylibC.ClearBackground(color)
    }
    
    /// Setup canvas (framebuffer) to start drawing
    @inlinable
    static func beginDrawing() {
        _RaylibC.BeginDrawing()
    }
    
    /// End canvas drawing and swap buffers (double buffering)
    @inlinable
    static func endDrawing() {
        _RaylibC.EndDrawing()
    }
    
    /// Begin 2D mode with custom camera (2D)
    @inlinable
    static func beginMode2D(_ camera: Camera2D) {
        _RaylibC.BeginMode2D(camera)
    }
    
    /// Ends 2D mode with custom camera
    @inlinable
    static func endMode2D() {
        _RaylibC.EndMode2D()
    }
    
    /// Begin 3D mode with custom camera (3D)
    @inlinable
    static func beginMode3D(_ camera: Camera3D) {
        _RaylibC.BeginMode3D(camera)
    }
    
    /// Ends 3D mode and returns to default 2D orthographic mode
    @inlinable
    static func endMode3D() {
        _RaylibC.EndMode3D()
    }
    
    /// Begin drawing to render texture
    @inlinable
    static func beginTextureMode(_ target: RenderTexture2D) {
        _RaylibC.BeginTextureMode(target)
    }
    
    /// Ends drawing to render texture
    @inlinable
    static func endTextureMode() {
        _RaylibC.EndTextureMode()
    }
    
    /// Begin custom shader drawing
    @inlinable
    static func beginShaderMode(_ shader: Shader) {
        _RaylibC.BeginShaderMode(shader)
    }
    
    /// End custom shader drawing (use default shader)
    @inlinable
    static func endShaderMode() {
        _RaylibC.EndShaderMode()
    }
    
    /// Begin blending mode (alpha, additive, multiplied), subtract, custom)
    @inlinable
    static func beginBlendMode(_ mode: BlendMode) {
        _RaylibC.BeginBlendMode(mode.rawValue)
    }
    
    /// End blending mode (reset to default: alpha blending)
    @inlinable
    static func endBlendMode() {
        _RaylibC.EndBlendMode()
    }
    
    /// Begin scissor mode (define screen area for following drawing)
    @inlinable
    static func beginScissorMode(_ x: Int32, _ y: Int32, _ width: Int32, _ height: Int32) {
        _RaylibC.BeginScissorMode(x, y, width, height)
    }
    
    /// End scissor mode
    @inlinable
    static func endScissorMode() {
        _RaylibC.EndScissorMode()
    }
    
    /// Begin stereo rendering (requires VR simulator)
    @inlinable
    static func beginVrStereoMode(_ config: VrStereoConfig) {
        _RaylibC.BeginVrStereoMode(config)
    }
    
    /// End stereo rendering (requires VR simulator)
    @inlinable
    static func endVrStereoMode() {
        _RaylibC.EndVrStereoMode()
    }
}


//MARK: - VR stereo config functions for VR simulator
public extension Raylib {
    /// Load VR stereo config for VR simulator device parameters
    @inlinable
    static func loadVrStereoConfig(_ device: VrDeviceInfo) -> VrStereoConfig {
        _RaylibC.LoadVrStereoConfig(device)
    }
    
    /// Unload VR stereo config
    @inlinable
    static func unloadVrStereoConfig(_ config: VrStereoConfig) {
        _RaylibC.UnloadVrStereoConfig(config)
    }
}


//MARK: - Shader management functions
public extension Raylib {
    // NOTE: Shader functionality is not available on OpenGL 1.1
    
    /// Load shader from files and bind default locations
    @inlinable
    static func loadShader(_ vsFileName: String, _ fsFileName: String) -> Shader {
        return vsFileName.withCString { vsCString in
            return fsFileName.withCString { fsCString in
                return _RaylibC.LoadShader(vsCString, fsCString)
            }
        }
    }
    
    /// Load shader from code strings and bind default locations
    @inlinable
    static func loadShaderFromMemory(_ vsCode: String, _ fsCode: String) -> Shader {
        return vsCode.withCString { vsCString in
            return fsCode.withCString { fsCString in
                return _RaylibC.LoadShaderFromMemory(vsCString, fsCString)
            }
        }
    }
    
    /// Get shader uniform location
    @inlinable
    static func getShaderLocation(_ shader: Shader, _ uniformName: String) -> Int32 {
        return uniformName.withCString { cString in
            return _RaylibC.GetShaderLocation(shader, cString)
        }
    }
    
    /// Get shader attribute location
    @inlinable
    static func getShaderLocationAttrib(_ shader: Shader, _ attribName: String) -> Int32 {
        return attribName.withCString { cString in
            return _RaylibC.GetShaderLocationAttrib(shader, cString)
        }
    }
    
    /// Set shader uniform value
    @inlinable
    static func setShaderValue(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ value: Any, _ uniformType: ShaderUniformDataType) {
        var _value = value
        _RaylibC.SetShaderValue(shader, locIndex.rawValue, &_value, uniformType.rawValue)
    }
    
    /// Set shader uniform value vector
    @inlinable
    static func setShaderValueV(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ value: Any, _ uniformType: ShaderUniformDataType, _ count: Int32) {
        var _value = value
        _RaylibC.SetShaderValueV(shader, locIndex.rawValue, &_value, uniformType.rawValue, count)
    }
    
    /// Set shader uniform value (matrix 4x4)
    @inlinable
    static func setShaderValueMatrix(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ mat: Matrix) {
        _RaylibC.SetShaderValueMatrix(shader, locIndex.rawValue, mat)
    }
    
    /// Set shader uniform value for texture (sampler2d)
    @inlinable
    static func setShaderValueTexture(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ texture: Texture2D) {
        _RaylibC.SetShaderValueTexture(shader, locIndex.rawValue, texture)
    }
    
    /// Unload shader from GPU memory (VRAM)
    @inlinable
    static func unloadShader(_ shader: Shader) {
        _RaylibC.UnloadShader(shader)
    }
}


//MARK: - Screen-space-related functions
public extension Raylib {
    /// Get a ray trace from mouse position
    @inlinable
    static func getMouseRay(_ mousePosition: Vector2, _ camera: Camera) -> Ray {
        return _RaylibC.GetMouseRay(mousePosition, camera)
    }
    
    /// Get camera transform matrix (view matrix)
    @inlinable
    static func getCameraMatrix(_ camera: Camera) -> Matrix {
        return _RaylibC.GetCameraMatrix(camera)
    }
    
    /// Get camera 2d transform matrix
    @inlinable
    static func getCameraMatrix2D(_ camera: Camera2D) -> Matrix {
        return _RaylibC.GetCameraMatrix2D(camera)
    }
    
    /// Get the screen space position for a 3d world space position
    @inlinable
    static func getWorldToScreen(_ position: Vector3, _ camera: Camera) -> Vector2 {
        return _RaylibC.GetWorldToScreen(position, camera)
    }
    
    /// Get the world space position for a 2d camera screen space position
    @inlinable
    static func getScreenToWorld2D(_ position: Vector2, _ camera: Camera2D) -> Vector2 {
        return _RaylibC.GetScreenToWorld2D(position, camera)
    }
    
    /// Get size position for a 3d world space position
    @inlinable
    static func getWorldToScreenEx(_ position: Vector3, _ camera: Camera, _ width: Int32, _ height: Int32) -> Vector2 {
        return _RaylibC.GetWorldToScreenEx(position, camera, width, height)
    }
    
    /// Get the screen space position for a 2d camera world space position
    @inlinable
    static func getWorldToScreen2D(_ position: Vector2, _ camera: Camera2D) -> Vector2 {
        return _RaylibC.GetWorldToScreen2D(position, camera)
    }
}


//MARK: - Timing-related functions
public extension Raylib {
    /// Set target FPS (maximum)
    @inlinable
    static func setTargetFPS(_ fps: Int32) {
        _RaylibC.SetTargetFPS(fps)
    }
    
    /// Get current FPS
    @inlinable
    static func getFPS() -> Int32 {
        return _RaylibC.GetFPS()
    }
    
    /// Get time in seconds for last frame drawn (delta time)
    @inlinable
    static func getFrameTime() -> Float {
        return _RaylibC.GetFrameTime()
    }
    
    /// Get elapsed time in seconds since InitWindow()
    @inlinable
    static func getTime() -> Double {
        return _RaylibC.GetTime()
    }
}


//MARK: - Misc. functions
public extension Raylib {
    /// Returns a random value between min and max (both included)
    @available(*, deprecated, message: "Use `Int32.random(in range:)`")
    @inlinable
    static func getRandomValue(_ min: Int32, _ max: Int32) -> Int32 {
        return _RaylibC.GetRandomValue(min, max)
    }
    
    /// Set the seed for the random number generator
    @inlinable
    static func setRandomSeed(_ seed: UInt32) {
        _RaylibC.SetRandomSeed(seed)
    }
    
    /// Takes a screenshot of current screen (filename extension defines format)
    @inlinable
    static func takeScreenshot(_ fileName: String) {
        return fileName.withCString { cString in
            _RaylibC.TakeScreenshot(cString)
        }
    }
    
    /// Setup init configuration flags (view FLAGS)
    @inlinable
    static func setConfigFlags(_ flags: ConfigFlags) {
        _RaylibC.SetConfigFlags(flags.rawValue)
    }
    
    /// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
    @available(*, unavailable, message: "The underlying function is variadic, which is unsupported in Swift.")
    @inlinable
    static func traceLog(_ logLevel: Int32, _ levels: Set<TraceLogLevel>) -> String {
        fatalError()
    }
    
    /// Set the current threshold (minimum) log level
    @inlinable
    static func setTraceLogLevel(_ logLevel: TraceLogLevel) {
        _RaylibC.SetTraceLogLevel(logLevel.rawValue)
    }
    
    /// Internal memory allocator
    @available(*, deprecated, message: "Manipulating memory is not recommended in Swift.")
    @inlinable
    static func memAlloc(_ size: Int32) -> UnsafeMutableRawPointer! {
        return _RaylibC.MemAlloc(size)
    }
    
    /// Internal memory reallocator
    @available(*, deprecated, message: "Manipulating memory is not recommended in Swift.")
    @inlinable
    static func nemRealloc(_ ptr: UnsafeMutableRawPointer!, _ size: Int32) -> UnsafeMutableRawPointer! {
        return _RaylibC.MemRealloc(ptr, size)
    }
    
    /// Internal memory free
    @available(*, deprecated, message: "Manipulating memory is not recommended in Swift.")
    @inlinable
    static func memFree(_ ptr: UnsafeMutableRawPointer!) {
        _RaylibC.MemFree(ptr)
    }
    
    /// Open URL with default system browser (if available)
    @inlinable
    static func openURL(_ url: String) {
        url.withCString { cString in
            _RaylibC.OpenURL(cString)
        }
    }
}


//MARK: - Set custom callbacks
// WARNING: Callbacks setup is intended for advance users
public extension Raylib {
    typealias TraceLogCallback = () -> ()
    // Set custom trace log
    @available(*, unavailable, message: "Can't be represented in Swift.")
    @inlinable
    static func setTraceLogCallback(_ callback: TraceLogCallback) {
        fatalError()
    }
    
    /// Set custom file binary data loader
    @inlinable
    static func setLoadFileDataCallback(_ callback: LoadFileDataCallback!) {
        _RaylibC.SetLoadFileDataCallback(callback)
    }
    
    typealias SaveFileDataCallback = () -> ()
    /// Set custom file binary data saver
    @available(*, unavailable, message: "Can't be represented in Swift.")
    @inlinable
    static func setSaveFileDataCallback(_ callback: SaveFileDataCallback) {
        fatalError()
    }
    
    typealias LoadFileTextCallback = () -> ()
    /// Set custom file text data loader
    @available(*, unavailable, message: "Can't be represented in Swift.")
    @inlinable
    static func setLoadFileTextCallback(_ callback: LoadFileTextCallback) {
        fatalError()
    }
    
    /// Set custom file text data saver
    @inlinable
    static func setSaveFileTextCallback(_ callback: SaveFileTextCallback!) {
        _RaylibC.SetSaveFileTextCallback(callback)
    }
}


//MARK: - Files management functions

public extension _RaylibC.FilePathList {
    @inlinable
    func paths() -> [String] {
        let buffer = UnsafeMutableBufferPointer(start: self.paths, count: Int(self.count))
        return buffer.compactMap({$0}).map({String(cString: $0)})
    }
}
public extension Raylib {
    /// Load file data as byte array (read)
    @inlinable
    static func loadFileData(_ fileName: String, _ bytesRead: inout UInt32) -> UnsafeMutablePointer<UInt8>! {
        return fileName.withCString { cString in
            return _RaylibC.LoadFileData(cString, &bytesRead)
        }
    }
    
    /// Unload file data allocated by LoadFileData()
    @inlinable
    static func unloadFileData(_ data: UnsafeMutablePointer<UInt8>!) {
        _RaylibC.UnloadFileData(data)
    }
    
    /// Save data to file from byte array (write), returns true on success
    @inlinable
    static func saveFileData(_ fileName: String, _ data: UnsafeMutableRawPointer!, _ bytesToWrite: UInt32) -> Bool {
        return fileName.withCString { cString in
            let result = _RaylibC.SaveFileData(cString, data, bytesToWrite)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Export data to code (.h), returns true on success
    @inlinable
    static func exportDataAsCode(_ data: UnsafeMutableRawPointer!, _ size: UInt32, _ fileName: String) -> Bool {
        return fileName.withCString { cString in
            let result = _RaylibC.ExportDataAsCode(data, size, cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Load text data from file (read), returns a '\0' terminated string
    @inlinable
    static func loadFileText(_ fileName: String) -> String {
        return fileName.withCString { cString in
            let _text = _RaylibC.LoadFileText(cString)!
            let text = String(cString: _text)
            _RaylibC.UnloadFileText(_text)
            return text
        }
    }
    
    /// Unload file text data allocated by LoadFileText()
    @inlinable @available(*, unavailable, message: "Swift will handle unloading automatically.")
    static func unloadFileText(_ text: UnsafeMutablePointer<CChar>!) {
        _RaylibC.UnloadFileText(text)
    }
    
    /// Save text data to file (write), string must be '\0' terminated, returns true on success
    @inlinable
    static func saveFileText(_ fileName: String, _ text: String) -> Bool {
        return fileName.withCString { fileCString in
            var _text = text.utf8CString
            return _text.withUnsafeMutableBufferPointer { textCString in
                let result = _RaylibC.SaveFileText(fileCString, textCString.baseAddress)
#if os(Windows)
                return result.rawValue != 0
#else
                return result
#endif
            }
        }
    }
    
    /// Check if file exists
    @inlinable
    static func fileExists(_ fileName: String) -> Bool {
        return fileName.withCString { cString in
            let result = _RaylibC.FileExists(cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Check if a directory path exists
    @inlinable
    static func directoryExists(_ dirPath: String) -> Bool {
        return dirPath.withCString { cString in
            let result = _RaylibC.DirectoryExists(cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Check file extension (including point: .png, .wav)
    @inlinable
    static func isFileExtension(_ fileName: String, _ ext: String) -> Bool {
        return fileName.withCString { fileCString in
            return ext.withCString { extCString in
                let result = _RaylibC.IsFileExtension(fileCString, extCString)
#if os(Windows)
                return result.rawValue != 0
#else
                return result
#endif
            }
        }
    }
    
    /// Get pointer to extension for a filename string (includes dot: `.png`)
    @inlinable
    static func getFileExtension(_ fileName: String) -> String {
        return fileName.withCString { cString in
            return String(cString: _RaylibC.GetFileExtension(cString))
        }
    }
    
    /// Get pointer to filename for a path string
    @inlinable
    static func getFileName(_ filePath: String) -> String {
        return filePath.withCString { cString in
            return String(cString: _RaylibC.GetFileName(cString))
        }
    }
    
    /// Get filename string without extension (uses static string)
    @inlinable
    static func getFileNameWithoutExt(_ filePath: String) -> String {
        return filePath.withCString { cString in
            return String(cString: _RaylibC.GetFileNameWithoutExt(cString))
        }
    }
    
    /// Get full path for a given fileName with path (uses static string)
    @inlinable
    static func getDirectoryPath(_ filePath: String) -> String {
        return filePath.withCString { cString in
            return String(cString: _RaylibC.GetDirectoryPath(cString))
        }
    }
    
    /// Get previous directory path for a given path (uses static string)
    @inlinable
    static func getPrevDirectoryPath(_ dirPath: String) -> String {
        return dirPath.withCString { cString in
            return String(cString: _RaylibC.GetPrevDirectoryPath(cString))
        }
    }
    
    /// Get current working directory (uses static string)
    @inlinable
    static func getWorkingDirectory() -> String {
        return String(cString: _RaylibC.GetWorkingDirectory())
    }
    
    /// Change working directory, return true on success
    @inlinable
    static func changeDirectory(_ dir: String) -> Bool {
        return dir.withCString { cString in
            let result = _RaylibC.ChangeDirectory(cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Check if a given path is a file or a directory
    @inlinable
    static func isPathFile(_ path: String) -> Bool {
        return path.withCString { cString in
            let result = _RaylibC.IsPathFile(cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Load directory filepaths
    @inlinable
    static func loadDirectoryFiles(_ dirPath: String) -> FilePathList {
        return dirPath.withCString { cString in
            return _RaylibC.LoadDirectoryFiles(cString)
        }
    }
    
    /// Load directory filepaths with extension filtering and recursive directory scan
    @inlinable
    static func loadDirectoryFilesEx(_ basePath: String, _ filter: String, _ scanSubdirs: Bool) -> FilePathList {
        return basePath.withCString { basePathCString in
            return filter.withCString { filterCString in
                return _RaylibC.LoadDirectoryFilesEx(basePathCString, filterCString, scanSubdirs)
            }
        }
    }
    
    /// Unload filepaths
    @inlinable
    static func unloadDirectoryFiles(_ files: FilePathList) {
        _RaylibC.UnloadDirectoryFiles(files)
    }
    
    /// Check if a file has been dropped into window
    @inlinable
    static var isFileDropped: Bool {
        let result = _RaylibC.IsFileDropped()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Load dropped filepaths
    @inlinable
    static func loadDroppedFiles() -> FilePathList {
        return _RaylibC.LoadDroppedFiles()
    }
    
    /// Unload dropped filepaths
    @inlinable
    static func unloadDroppedFiles(_ files: FilePathList) {
        _RaylibC.UnloadDroppedFiles(files)
    }
    
    /// Get file modification time (last write time)
    @inlinable
    static func getFileModTime(_ fileName: String) -> Int64 {
        return fileName.withCString { cString -> Int64 in
            return Int64(_RaylibC.GetFileModTime(cString))
        }
    }
}


//MARK: - Compression/Encoding functionality
public extension Raylib {
    /// Compress data (DEFLATE algorithm), memory must be MemFree()
    @inlinable
    static func compressData(_ data: UnsafeMutablePointer<UInt8>!, _ dataLength: Int32, _ compDataLength: inout Int32) -> UnsafeMutablePointer<UInt8>! {
        return _RaylibC.CompressData(data, dataLength, &compDataLength)
    }
    
    /// Decompress data (DEFLATE algorithm), memory must be MemFree()
    @inlinable
    static func decompressData(_ compData: UnsafeMutablePointer<UInt8>!, _ compDataLength: Int32, _ dataLength: inout Int32) -> UnsafeMutablePointer<UInt8>! {
        return _RaylibC.DecompressData(compData, compDataLength, &dataLength)
    }
    
    /// Encode data to Base64 string, memory must be MemFree()
    @available(*, deprecated, message: "Use Swift's Foundation `Data` API")
    static func encodeDataBase64(_ data: UnsafePointer<UInt8>!, _ dataLength: Int32, _ outputLength: UnsafeMutablePointer<Int32>!) -> UnsafeMutablePointer<CChar>? {
        return _RaylibC.EncodeDataBase64(data, dataLength, outputLength)
    }
    
    /// Decode Base64 string data, memory must be MemFree()
    @available(*, deprecated, message: "Use Swift's Foundation `Data` API")
    static func decodeDataBase64(_ data: UnsafeMutablePointer<UInt8>, _ outputLength: UnsafeMutablePointer<Int32>) -> UnsafeMutablePointer<UInt8> {
        return _RaylibC.DecodeDataBase64(data, outputLength)
    }
}

//------------------------------------------------------------------------------------
// Input Handling Functions (Module: core)
//------------------------------------------------------------------------------------
//MARK: - Input-related functions: keyboard
public extension Raylib {
    /// Check if a key has been pressed once
    @inlinable
    static func isKeyPressed(_ key: KeyboardKey) -> Bool {
        let result = _RaylibC.IsKeyPressed(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a key is being pressed
    @inlinable
    static func isKeyDown(_ key: KeyboardKey) -> Bool {
        let result = _RaylibC.IsKeyDown(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a key has been released once
    @inlinable
    static func isKeyReleased(_ key: KeyboardKey) -> Bool {
        let result = _RaylibC.IsKeyReleased(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a key is NOT being pressed
    @inlinable
    static func isKeyUp(_ key: KeyboardKey) -> Bool {
        let result = _RaylibC.IsKeyUp(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set a custom key to exit program (default is ESC)
    @inlinable
    static func setExitKey(_ key: KeyboardKey) {
        _RaylibC.SetExitKey(key.rawValue)
    }
    
    /// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
    @inlinable
    static func getKeyPressed() -> KeyboardKey? {
        let result = _RaylibC.GetKeyPressed()
        guard let key = KeyboardKey(rawValue: result) else {print("Key code \(result) not member of `KeyboardKey`."); return nil}
        return key
    }
    
    /// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
    @inlinable
    static func getCharPressed() -> Character? {
        let result = _RaylibC.GetCharPressed()
        guard let scalar = UnicodeScalar(UInt32(result)) else {return nil}
        return Character(scalar)
    }
}


//MARK: - Input-related functions: gamepads
public extension Raylib {
    /// Check if a gamepad is available
    @inlinable
    static func isGamepadAvailable(_ gamepad: Int32) -> Bool {
        let result = _RaylibC.IsGamepadAvailable(gamepad)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get gamepad internal name id
    @inlinable
    static func getGamepadName(_ gamepad: Int32) -> String {
        return String(cString: _RaylibC.GetGamepadName(gamepad))
    }
    
    /// Check if a gamepad button has been pressed once
    @inlinable
    static func isGamepadButtonPressed(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = _RaylibC.IsGamepadButtonPressed(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a gamepad button is being pressed
    @inlinable
    static func isGamepadButtonDown(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = _RaylibC.IsGamepadButtonDown(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a gamepad button has been released once
    @inlinable
    static func isGamepadButtonReleased(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = _RaylibC.IsGamepadButtonReleased(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a gamepad button is NOT being pressed
    @inlinable
    static func isGamepadButtonUp(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = _RaylibC.IsGamepadButtonUp(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get the last gamepad button pressed
    @inlinable
    static func getGamepadButtonPressed() -> GamepadButton {
        return GamepadButton(rawValue: _RaylibC.GetGamepadButtonPressed())!
    }
    
    /// Get gamepad axis count for a gamepad
    @inlinable
    static func getGamepadAxisCount(_ gamepad: Int32) -> Int32 {
        return _RaylibC.GetGamepadAxisCount(gamepad)
    }
    
    /// Get axis movement value for a gamepad axis
    @inlinable
    static func getGamepadAxisMovement(_ gamepad: Int32, _ axis: GamepadAxis) -> Float {
        return _RaylibC.GetGamepadAxisMovement(gamepad, axis.rawValue)
    }
    
    /// Set internal gamepad mappings (SDL_GameControllerDB)
    @inlinable
    static func setGamepadMappings(_ mappings: String) -> Bool {
        return mappings.withCString { cString in
            return _RaylibC.SetGamepadMappings(cString) != 0
        }
    }
}


//MARK: - Input-related functions: mouse
public extension Raylib {
    /// Check if a mouse button has been pressed once
    @inlinable
    static func isMouseButtonPressed(_ button: MouseButton) -> Bool {
        let result = _RaylibC.IsMouseButtonPressed(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a mouse button is being pressed
    @inlinable
    static func isMouseButtonDown(_ button: MouseButton) -> Bool {
        let result = _RaylibC.IsMouseButtonDown(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a mouse button has been released once
    @inlinable
    static func isMouseButtonReleased(_ button: MouseButton) -> Bool {
        let result = _RaylibC.IsMouseButtonReleased(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a mouse button is NOT being pressed
    @inlinable
    static func isMouseButtonUp(_ button: MouseButton) -> Bool {
        let result = _RaylibC.IsMouseButtonUp(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get mouse position X
    @inlinable
    static func getMouseX() -> Int32 {
        return _RaylibC.GetMouseX()
    }
    
    /// Get mouse position Y
    @inlinable
    static func getMouseY() -> Int32 {
        return _RaylibC.GetMouseY()
    }
    
    /// Get mouse position XY
    @inlinable
    static func getMousePosition() -> Vector2 {
        return _RaylibC.GetMousePosition()
    }
    
    /// Set mouse position XY
    @inlinable
    static func setMousePosition(_ x: Int32, _ y: Int32) {
        _RaylibC.SetMousePosition(x, y)
    }
    
    /// Set mouse offset
    @inlinable
    static func setMouseOffset(_ offsetX: Int32, _ offsetY: Int32) {
        _RaylibC.SetMouseOffset(offsetX, offsetY)
    }
    
    /// Set mouse scaling
    @inlinable
    static func setMouseScale(_ scaleX: Float, _ scaleY: Float) {
        _RaylibC.SetMouseScale(scaleX, scaleY)
    }
    
    /// Get mouse wheel movement for X or Y, whichever is larger
    @inlinable
    static func getMouseWheelMove() -> Float {
        return _RaylibC.GetMouseWheelMove()
    }
    
    /// Get mouse wheel movement for both X and Y
    @inlinable
    static func getMouseWheelMoveV() -> Vector2 {
        return _RaylibC.GetMouseWheelMoveV()
    }
    
    /// Set mouse cursor
    @inlinable
    static func setMouseCursor(_ cursor: MouseCursor) {
        _RaylibC.SetMouseCursor(cursor.rawValue)
    }
}


//MARK: - Input-related functions: touch
public extension Raylib {
    /// Get touch position X for touch point 0 (relative to screen size)
    @inlinable
    static func getTouchX() -> Int32 {
        return _RaylibC.GetTouchX()
    }
    
    /// Get touch position Y for touch point 0 (relative to screen size)
    @inlinable
    static func getTouchY() -> Int32 {
        return _RaylibC.GetTouchY()
    }
    
    /// Get touch position XY for a touch point index (relative to screen size)
    @inlinable
    static func getTouchPosition(_ index: Int32) -> Vector2 {
        return _RaylibC.GetTouchPosition(index)
    }
    
    /// Get touch point identifier for given index
    @inlinable
    static func getTouchPointId(_ index: Int32) -> Int32 {
        return _RaylibC.GetTouchPointId(index)
    }
    
    /// Get number of touch points
    @inlinable
    static func getTouchPointCount() -> Int32 {
        return _RaylibC.GetTouchPointCount()
    }
}
