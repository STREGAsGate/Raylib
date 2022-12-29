/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import RaylibC

//------------------------------------------------------------------------------------
// Window and Graphics Device Functions (Module: core)
//------------------------------------------------------------------------------------
//MARK: - Window-related functions
public extension Raylib {
    /// Initialize window and OpenGL context
    @inlinable
    static func initWindow(_ width: Int32, _ height: Int32, _ title: String) {
        title.withCString { title in
            RaylibC.InitWindow(width, height, title)
        }
    }
    
    /// Check if KEY_ESCAPE pressed or Close icon pressed
    @inlinable
    static var windowShouldClose: Bool {
        let result = RaylibC.WindowShouldClose()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Close window and unload OpenGL context
    @inlinable
    static func closeWindow() {
        RaylibC.CloseWindow()
    }
    
    /// Check if window has been initialized successfully
    @inlinable
    static var isWindowReady: Bool {
        let result = RaylibC.IsWindowReady()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently fullscreen
    @inlinable
    static var isWindowFullscreen: Bool {
        let result = RaylibC.IsWindowFullscreen()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently hidden (only PLATFORM_DESKTOP)
    @inlinable
    static var isWindowHidden: Bool {
        let result = RaylibC.IsWindowHidden()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently minimized (only PLATFORM_DESKTOP)
    @inlinable
    static var isWindowMinimized: Bool {
        let result = RaylibC.IsWindowMinimized()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently maximized (only PLATFORM_DESKTOP)
    @inlinable
    static var isWindowMaximized: Bool {
        let result = RaylibC.IsWindowMaximized()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window is currently focused (only PLATFORM_DESKTOP)
    @inlinable
    static var isWindowFocused: Bool {
        let result = RaylibC.IsWindowFocused()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if window has been resized last frame
    @inlinable
    static var isWindowResized: Bool {
        let result = RaylibC.IsWindowResized()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if one specific window flag is enabled
    @inlinable
    static func isWindowState(_ flag: ConfigFlags) -> Bool {
        let result = RaylibC.IsWindowState(flag.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set window configuration state using flags
    @inlinable
    static func setWindowState(_ flags: ConfigFlags) {
        RaylibC.SetWindowState(flags.rawValue)
    }
    
    /// Clear window configuration state flags
    @inlinable
    static func clearWindowState(_ flags: ConfigFlags) {
        RaylibC.ClearWindowState(flags.rawValue)
    }
    
    /// Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
    @inlinable
    static func toggleFullscreen() {
        RaylibC.ToggleFullscreen()
    }
    
    /// Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
    @inlinable
    static func maximizeWindow() {
        RaylibC.MaximizeWindow()
    }
    
    /// Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
    @inlinable
    static func minimizeWindow() {
        RaylibC.MinimizeWindow()
    }
    
    /// Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
    @inlinable
    static func restoreWindow() {
        RaylibC.RestoreWindow()
    }
    
    /// Set icon for window (only PLATFORM_DESKTOP)
    @inlinable
    static func setWindowIcon(_ image: Image) {
        RaylibC.SetWindowIcon(image)
    }
    
    /// Set title for window (only PLATFORM_DESKTOP)
    @inlinable
    static func setWindowTitle(_ title: String) {
        title.withCString { title in
            RaylibC.SetWindowTitle(title)
        }
    }
    
    /// Set window position on screen (only PLATFORM_DESKTOP)
    @inlinable
    static func setWindowPosition(_ x: Int32, _ y: Int32) {
        RaylibC.SetWindowPosition(x, y)
    }
    
    /// Set monitor for the current window (fullscreen mode)
    @inlinable
    static func setWindowMonitor(_ monitor: Int32) {
        RaylibC.SetWindowMonitor(monitor)
    }
    
    /// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
    @inlinable
    static func setWindowMinSize(_ width: Int32, _ height: Int32) {
        RaylibC.SetWindowMinSize(width, height)
    }
    
    /// Set window dimensions
    @inlinable
    static func setWindowSize(_ width: Int32, _ height: Int32) {
        RaylibC.SetWindowSize(width, height)
    }
    
    /// Get native window handle
    @inlinable
    static func getWindowHandle() -> UnsafeMutableRawPointer! {
        return RaylibC.GetWindowHandle()
    }
    
    /// Get current screen width
    @inlinable
    static func getScreenWidth() -> Int32 {
        return RaylibC.GetScreenWidth()
    }
    
    /// Get current screen height
    @inlinable
    static func getScreenHeight() -> Int32 {
        return RaylibC.GetScreenHeight()
    }
    
    /// Get number of connected monitors
    @inlinable
    static func getMonitorCount() -> Int32 {
        return RaylibC.GetMonitorCount()
    }
    
    /// Get current connected monitor
    @inlinable
    static func getCurrentMonitor() -> Int32 {
        return RaylibC.GetCurrentMonitor()
    }
    
    /// Get specified monitor position
    @inlinable
    static func getMonitorPosition(_ monitor: Int32) -> Vector2 {
        return RaylibC.GetMonitorPosition(monitor)
    }
    
    /// Get specified monitor width (max available by monitor)
    @inlinable
    static func getMonitorWidth(_ monitor: Int32) -> Int32 {
        return RaylibC.GetMonitorWidth(monitor)
    }
    
    /// Get specified monitor height (max available by monitor)
    @inlinable
    static func getMonitorHeight(_ monitor: Int32) -> Int32 {
        return RaylibC.GetMonitorHeight(monitor)
    }
    
    /// Get specified monitor physical width in millimetres
    @inlinable
    static func getMonitorPhysicalWidth(_ monitor: Int32) -> Int32 {
        return RaylibC.GetMonitorPhysicalWidth(monitor)
    }
    
    /// Get specified monitor physical height in millimetres
    @inlinable
    static func getMonitorPhysicalHeight(_ monitor: Int32) -> Int32 {
        return RaylibC.GetMonitorPhysicalHeight(monitor)
    }
    
    /// Get specified monitor refresh rate
    @inlinable
    static func getMonitorRefreshRate(_ monitor: Int32) -> Int32 {
        return RaylibC.GetMonitorRefreshRate(monitor)
    }
    
    /// Get window position XY on monitor
    @inlinable
    static func getWindowPosition() -> Vector2 {
        return RaylibC.GetWindowPosition()
    }
    
    /// Get window scale DPI factor
    @inlinable
    static func getWindowScaleDPI() -> Vector2 {
        return RaylibC.GetWindowScaleDPI()
    }
    
    /// Get the human-readable, UTF-8 encoded name of the primary monitor
    @inlinable
    static func getMonitorName(_ monitor: Int32) -> String {
        return String(cString: RaylibC.GetMonitorName(monitor))
    }
    
    /// Set clipboard text content
    @inlinable
    static func setClipboardText(_ text: String) {
        RaylibC.SetClipboardText(text)
    }
    
    /// Get clipboard text content
    @inlinable
    static func getClipboardText() -> String {
        return String(cString: RaylibC.GetClipboardText())
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
        RaylibC.SwapScreenBuffer()
    }
    
    /// Register all input events
    /// - note: Those functions are intended for advance users that want full control over the frame processing
    ///         By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timming + PollInputEvents()
    ///         To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
    @inlinable
    static func pollInputEvents() {
        RaylibC.PollInputEvents()
    }
    
    /// Wait for some milliseconds (halt program execution)
    /// - note: Those functions are intended for advance users that want full control over the frame processing
    ///         By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timming + PollInputEvents()
    ///         To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
    @inlinable
    static func waitTime(_ ms: Float) {
        RaylibC.WaitTime(ms)
    }
}


//MARK: - Cursor-related functions
public extension Raylib {
    /// Shows cursor
    @inlinable
    static func showCursor() {
        RaylibC.ShowCursor()
    }
    
    /// Hides cursor
    @inlinable
    static func hideCursor() {
        RaylibC.HideCursor()
    }
    
    /// Check if cursor is not visible
    @inlinable
    static var isCursorHidden: Bool {
        let result = RaylibC.IsCursorHidden()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Enables cursor (unlock cursor)
    @inlinable
    static func enableCursor() {
        RaylibC.EnableCursor()
    }
    
    /// Disables cursor (lock cursor)
    @inlinable
    static func disableCursor() {
        RaylibC.DisableCursor()
    }
    
    /// Check if cursor is on the screen
    @inlinable
    static var isCursorOnScreen: Bool {
        let result = RaylibC.IsCursorOnScreen()
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
        RaylibC.ClearBackground(color)
    }
    
    /// Setup canvas (framebuffer) to start drawing
    @inlinable
    static func beginDrawing() {
        RaylibC.BeginDrawing()
    }
    
    /// End canvas drawing and swap buffers (double buffering)
    @inlinable
    static func endDrawing() {
        RaylibC.EndDrawing()
    }
    
    /// Begin 2D mode with custom camera (2D)
    @inlinable
    static func beginMode2D(_ camera: Camera2D) {
        RaylibC.BeginMode2D(camera)
    }
    
    /// Ends 2D mode with custom camera
    @inlinable
    static func endMode2D() {
        RaylibC.EndMode2D()
    }
    
    /// Begin 3D mode with custom camera (3D)
    @inlinable
    static func beginMode3D(_ camera: Camera3D) {
        RaylibC.BeginMode3D(camera)
    }
    
    /// Ends 3D mode and returns to default 2D orthographic mode
    @inlinable
    static func endMode3D() {
        RaylibC.EndMode3D()
    }
    
    /// Begin drawing to render texture
    @inlinable
    static func beginTextureMode(_ target: RenderTexture2D) {
        RaylibC.BeginTextureMode(target)
    }
    
    /// Ends drawing to render texture
    @inlinable
    static func endTextureMode() {
        RaylibC.EndTextureMode()
    }
    
    /// Begin custom shader drawing
    @inlinable
    static func beginShaderMode(_ shader: Shader) {
        RaylibC.BeginShaderMode(shader)
    }
    
    /// End custom shader drawing (use default shader)
    @inlinable
    static func endShaderMode() {
        RaylibC.EndShaderMode()
    }
    
    /// Begin blending mode (alpha, additive, multiplied), subtract, custom)
    @inlinable
    static func beginBlendMode(_ mode: BlendMode) {
        RaylibC.BeginBlendMode(mode.rawValue)
    }
    
    /// End blending mode (reset to default: alpha blending)
    @inlinable
    static func endBlendMode() {
        RaylibC.EndBlendMode()
    }
    
    /// Begin scissor mode (define screen area for following drawing)
    @inlinable
    static func beginScissorMode(_ x: Int32, _ y: Int32, _ width: Int32, _ height: Int32) {
        RaylibC.BeginScissorMode(x, y, width, height)
    }
    
    /// End scissor mode
    @inlinable
    static func endScissorMode() {
        RaylibC.EndScissorMode()
    }
    
    /// Begin stereo rendering (requires VR simulator)
    @inlinable
    static func beginVrStereoMode(_ config: VrStereoConfig) {
        RaylibC.BeginVrStereoMode(config)
    }
    
    /// End stereo rendering (requires VR simulator)
    @inlinable
    static func endVrStereoMode() {
        RaylibC.EndVrStereoMode()
    }
}


//MARK: - VR stereo config functions for VR simulator
public extension Raylib {
    /// Load VR stereo config for VR simulator device parameters
    @inlinable
    static func loadVrStereoConfig(_ device: VrDeviceInfo) -> VrStereoConfig {
        RaylibC.LoadVrStereoConfig(device)
    }
    
    /// Unload VR stereo config
    @inlinable
    static func unloadVrStereoConfig(_ config: VrStereoConfig) {
        RaylibC.UnloadVrStereoConfig(config)
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
                return RaylibC.LoadShader(vsCString, fsCString)
            }
        }
    }
    
    /// Load shader from code strings and bind default locations
    @inlinable
    static func loadShaderFromMemory(_ vsCode: String, _ fsCode: String) -> Shader {
        return vsCode.withCString { vsCString in
            return fsCode.withCString { fsCString in
                return RaylibC.LoadShaderFromMemory(vsCString, fsCString)
            }
        }
    }
    
    /// Get shader uniform location
    @inlinable
    static func getShaderLocation(_ shader: Shader, _ uniformName: String) -> Int32 {
        return uniformName.withCString { cString in
            return RaylibC.GetShaderLocation(shader, cString)
        }
    }
    
    /// Get shader attribute location
    @inlinable
    static func getShaderLocationAttrib(_ shader: Shader, _ attribName: String) -> Int32 {
        return attribName.withCString { cString in
            return RaylibC.GetShaderLocationAttrib(shader, cString)
        }
    }
    
    /// Set shader uniform value
    @inlinable
    static func setShaderValue(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ value: Any, _ uniformType: ShaderUniformDataType) {
        var _value = value
        RaylibC.SetShaderValue(shader, locIndex.rawValue, &_value, uniformType.rawValue)
    }
    
    /// Set shader uniform value vector
    @inlinable
    static func setShaderValueV(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ value: Any, _ uniformType: ShaderUniformDataType, _ count: Int32) {
        var _value = value
        RaylibC.SetShaderValueV(shader, locIndex.rawValue, &_value, uniformType.rawValue, count)
    }
    
    /// Set shader uniform value (matrix 4x4)
    @inlinable
    static func setShaderValueMatrix(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ mat: Matrix) {
        RaylibC.SetShaderValueMatrix(shader, locIndex.rawValue, mat)
    }
    
    /// Set shader uniform value for texture (sampler2d)
    @inlinable
    static func setShaderValueTexture(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ texture: Texture2D) {
        RaylibC.SetShaderValueTexture(shader, locIndex.rawValue, texture)
    }
    
    /// Unload shader from GPU memory (VRAM)
    @inlinable
    static func unloadShader(_ shader: Shader) {
        RaylibC.UnloadShader(shader)
    }
}


//MARK: - Screen-space-related functions
public extension Raylib {
    /// Get a ray trace from mouse position
    @inlinable
    static func getMouseRay(_ mousePosition: Vector2, _ camera: Camera) -> Ray {
        return RaylibC.GetMouseRay(mousePosition, camera)
    }
    
    /// Get camera transform matrix (view matrix)
    @inlinable
    static func getCameraMatrix(_ camera: Camera) -> Matrix {
        return RaylibC.GetCameraMatrix(camera)
    }
    
    /// Get camera 2d transform matrix
    @inlinable
    static func getCameraMatrix2D(_ camera: Camera2D) -> Matrix {
        return RaylibC.GetCameraMatrix2D(camera)
    }
    
    /// Get the screen space position for a 3d world space position
    @inlinable
    static func getWorldToScreen(_ position: Vector3, _ camera: Camera) -> Vector2 {
        return RaylibC.GetWorldToScreen(position, camera)
    }
    
    /// Get size position for a 3d world space position
    @inlinable
    static func getWorldToScreenEx(_ position: Vector3, _ camera: Camera, _ width: Int32, _ height: Int32) -> Vector2 {
        return RaylibC.GetWorldToScreenEx(position, camera, width, height)
    }
    
    /// Get the screen space position for a 2d camera world space position
    @inlinable
    static func getWorldToScreen2D(_ position: Vector2, _ camera: Camera2D) -> Vector2 {
        return RaylibC.GetWorldToScreen2D(position, camera)
    }
    
    /// Get the world space position for a 2d camera screen space position
    @inlinable
    static func getScreenToWorld2D(_ position: Vector2, _ camera: Camera2D) -> Vector2 {
        return RaylibC.GetScreenToWorld2D(position, camera)
    }
}


//MARK: - Timing-related functions
public extension Raylib {
    /// Set target FPS (maximum)
    @inlinable
    static func setTargetFPS(_ fps: Int32) {
        RaylibC.SetTargetFPS(fps)
    }
    
    /// Get current FPS
    @inlinable
    static func getFPS() -> Int32 {
        return RaylibC.GetFPS()
    }
    
    /// Get time in seconds for last frame drawn (delta time)
    @inlinable
    static func getFrameTime() -> Float {
        return RaylibC.GetFrameTime()
    }
    
    /// Get elapsed time in seconds since InitWindow()
    @inlinable
    static func getTime() -> Double {
        return RaylibC.GetTime()
    }
}


//MARK: - Misc. functions
public extension Raylib {
    /// Returns a random value between min and max (both included)
    @available(*, deprecated, message: "Use `Int32.random(in range:)`")
    @inlinable
    static func getRandomValue(_ min: Int32, _ max: Int32) -> Int32 {
        return RaylibC.GetRandomValue(min, max)
    }
    
    /// Set the seed for the random number generator
    @inlinable
    static func setRandomSeed(_ seed: UInt32) {
        RaylibC.SetRandomSeed(seed)
    }
    
    /// Takes a screenshot of current screen (filename extension defines format)
    @inlinable
    static func takeScreenshot(_ fileName: String) {
        return fileName.withCString { cString in
            RaylibC.TakeScreenshot(cString)
        }
    }
    
    /// Setup init configuration flags (view FLAGS)
    @inlinable
    static func setConfigFlags(_ flags: ConfigFlags) {
        RaylibC.SetConfigFlags(flags.rawValue)
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
        RaylibC.SetTraceLogLevel(logLevel.rawValue)
    }
    
    /// Internal memory allocator
    @available(*, deprecated, message: "Manipulating memory is not recommended in Swift.")
    @inlinable
    static func memAlloc(_ size: Int32) -> UnsafeMutableRawPointer! {
        return RaylibC.MemAlloc(size)
    }
    
    /// Internal memory reallocator
    @available(*, deprecated, message: "Manipulating memory is not recommended in Swift.")
    @inlinable
    static func nemRealloc(_ ptr: UnsafeMutableRawPointer!, _ size: Int32) -> UnsafeMutableRawPointer! {
        return RaylibC.MemRealloc(ptr, size)
    }
    
    /// Internal memory free
    @available(*, deprecated, message: "Manipulating memory is not recommended in Swift.")
    @inlinable
    static func memFree(_ ptr: UnsafeMutableRawPointer!) {
        RaylibC.MemFree(ptr)
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
        RaylibC.SetLoadFileDataCallback(callback)
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
        RaylibC.SetSaveFileTextCallback(callback)
    }
}


//MARK: - Files management functions
public extension Raylib {
    /// Load file data as byte array (read)
    @inlinable
    static func loadFileData(_ fileName: String, _ bytesRead: inout UInt32) -> UnsafeMutablePointer<UInt8>! {
        return fileName.withCString { cString in
            return RaylibC.LoadFileData(cString, &bytesRead)
        }
    }
    
    /// Unload file data allocated by LoadFileData()
    @inlinable
    static func unloadFileData(_ data: UnsafeMutablePointer<UInt8>!) {
        RaylibC.UnloadFileData(data)
    }
    
    /// Save data to file from byte array (write), returns true on success
    @inlinable
    static func saveFileData(_ fileName: String, _ data: UnsafeMutableRawPointer!, _ bytesToWrite: UInt32) -> Bool {
        return fileName.withCString { cString in
            let result = RaylibC.SaveFileData(cString, data, bytesToWrite)
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
            let _text = RaylibC.LoadFileText(cString)!
            let text = String(cString: _text)
            RaylibC.UnloadFileText(_text)
            return text
        }
    }
    
    /// Unload file text data allocated by LoadFileText()
    @inlinable @available(*, unavailable, message: "Swift will handle unloading automatically.")
    static func unloadFileText(_ text: UnsafeMutablePointer<CChar>!) {
        RaylibC.UnloadFileText(text)
    }
    
    /// Save text data to file (write), string must be '\0' terminated, returns true on success
    @inlinable
    static func saveFileText(_ fileName: String, _ text: String) -> Bool {
        return fileName.withCString { fileCString in
            var _text = text.utf8CString
            return _text.withUnsafeMutableBufferPointer { textCString in
                let result = RaylibC.SaveFileText(fileCString, textCString.baseAddress)
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
            let result = RaylibC.FileExists(cString)
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
            let result = RaylibC.DirectoryExists(cString)
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
                let result = RaylibC.IsFileExtension(fileCString, extCString)
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
            return String(cString: RaylibC.GetFileExtension(cString))
        }
    }
    
    /// Get pointer to filename for a path string
    @inlinable
    static func getFileName(_ filePath: String) -> String {
        return filePath.withCString { cString in
            return String(cString: RaylibC.GetFileName(cString))
        }
    }
    
    /// Get filename string without extension (uses static string)
    @inlinable
    static func getFileNameWithoutExt(_ filePath: String) -> String {
        return filePath.withCString { cString in
            return String(cString: RaylibC.GetFileNameWithoutExt(cString))
        }
    }
    
    /// Get full path for a given fileName with path (uses static string)
    @inlinable
    static func getDirectoryPath(_ filePath: String) -> String {
        return filePath.withCString { cString in
            return String(cString: RaylibC.GetDirectoryPath(cString))
        }
    }
    
    /// Get previous directory path for a given path (uses static string)
    @inlinable
    static func getPrevDirectoryPath(_ dirPath: String) -> String {
        return dirPath.withCString { cString in
            return String(cString: RaylibC.GetPrevDirectoryPath(cString))
        }
    }
    
    /// Get current working directory (uses static string)
    @inlinable
    static func getWorkingDirectory() -> String {
        return String(cString: RaylibC.GetWorkingDirectory())
    }
    
    /// Get filenames in a directory path (memory should be freed)
    @inlinable
    static func getDirectoryFiles(_ dirPath: String) -> [String] {
        return dirPath.withCString { cString in
            var count: Int32 = 0
            let result = RaylibC.GetDirectoryFiles(cString, &count)
            let buffer = UnsafeMutableBufferPointer(start: result, count: Int(count))
            return buffer.compactMap({$0}).map({String(cString: $0)})
        }
    }
    
    /// Clear directory files paths buffers (free memory)
    @inlinable
    static func clearDirectoryFiles() {
        RaylibC.ClearDirectoryFiles()
    }
    
    /// Change working directory, return true on success
    @inlinable
    static func changeDirectory(_ dir: String) -> Bool {
        return dir.withCString { cString in
            let result = RaylibC.ChangeDirectory(cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Check if a file has been dropped into window
    @inlinable
    static var isFileDropped: Bool {
        let result = RaylibC.IsFileDropped()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get dropped files names (memory should be freed)
    @inlinable
    static func getDroppedFiles() -> [String] {
        var count: Int32 = 0
        let result = RaylibC.GetDroppedFiles(&count)
        let buffer = UnsafeMutableBufferPointer(start: result, count: Int(count))
        return buffer.compactMap({$0}).map({String(cString: $0)})
    }
    
    /// Clear dropped files paths buffer (free memory)
    @inlinable
    static func clearDroppedFiles() {
        RaylibC.ClearDroppedFiles()
    }
    
    /// Get file modification time (last write time)
    @inlinable
    static func getFileModTime(_ fileName: String) -> Int64 {
        return fileName.withCString { cString -> Int64 in
            return Int64(RaylibC.GetFileModTime(cString))
        }
    }
}


//MARK: - Compression/Encoding functionality
public extension Raylib {
    /// Compress data (DEFLATE algorithm)
    @inlinable
    static func compressData(_ data: UnsafeMutablePointer<UInt8>!, _ dataLength: Int32, _ compDataLength: inout Int32) -> UnsafeMutablePointer<UInt8>! {
        return RaylibC.CompressData(data, dataLength, &compDataLength)
    }
    
    /// Decompress data (DEFLATE algorithm)
    @inlinable
    static func decompressData(_ compData: UnsafeMutablePointer<UInt8>!, _ compDataLength: Int32, _ dataLength: inout Int32) -> UnsafeMutablePointer<UInt8>! {
        return RaylibC.DecompressData(compData, compDataLength, &dataLength)
    }
    
    /// Encode data to Base64 string
    @available(*, deprecated, message: "Use Swift's Foundation `Data` API")
    static func encodeDataBase64(_ data: UnsafePointer<UInt8>!, _ dataLength: Int32, _ outputLength: UnsafeMutablePointer<Int32>!) -> UnsafeMutablePointer<CChar>? {
        return RaylibC.EncodeDataBase64(data, dataLength, outputLength)
    }
    
    /// Decode Base64 string data
    @available(*, deprecated, message: "Use Swift's Foundation `Data` API")
    static func decodeDataBase64(_ data: UnsafeMutablePointer<UInt8>, _ outputLength: UnsafeMutablePointer<Int32>) -> UnsafeMutablePointer<UInt8> {
        return RaylibC.DecodeDataBase64(data, outputLength)
    }
}

//MARK: - Persistent storage management
public extension Raylib {
    /// Save integer value to storage file (to defined position), returns true on success
    @inlinable
    static func saveStorageValue(_ position: UInt32, _ value: Int32) -> Bool {
        let result = RaylibC.SaveStorageValue(position, value)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Load integer value from storage file (from defined position)
    @inlinable
    static func loadStorageValue(_ position: UInt32) -> Int32 {
        return RaylibC.LoadStorageValue(position)
    }
    
    /// Open URL with default system browser (if available)
    @inlinable
    static func openURL(_ url: String) {
        url.withCString { cString in
            RaylibC.OpenURL(cString)
        }
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
        let result = RaylibC.IsKeyPressed(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a key is being pressed
    @inlinable
    static func isKeyDown(_ key: KeyboardKey) -> Bool {
        let result = RaylibC.IsKeyDown(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a key has been released once
    @inlinable
    static func isKeyReleased(_ key: KeyboardKey) -> Bool {
        let result = RaylibC.IsKeyReleased(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a key is NOT being pressed
    @inlinable
    static func isKeyUp(_ key: KeyboardKey) -> Bool {
        let result = RaylibC.IsKeyUp(key.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set a custom key to exit program (default is ESC)
    @inlinable
    static func setExitKey(_ key: KeyboardKey) {
        RaylibC.SetExitKey(key.rawValue)
    }
    
    /// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
    @inlinable
    static func getKeyPressed() -> KeyboardKey? {
        let result = RaylibC.GetKeyPressed()
        guard let key = KeyboardKey(rawValue: result) else {print("Key code \(result) not member of `KeyboardKey`."); return nil}
        return key
    }
    
    /// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
    @inlinable
    static func getCharPressed() -> Character? {
        let result = RaylibC.GetCharPressed()
        guard let scalar = UnicodeScalar(UInt32(result)) else {return nil}
        return Character(scalar)
    }
}


//MARK: - Input-related functions: gamepads
public extension Raylib {
    /// Check if a gamepad is available
    @inlinable
    static func isGamepadAvailable(_ gamepad: Int32) -> Bool {
        let result = RaylibC.IsGamepadAvailable(gamepad)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get gamepad internal name id
    @inlinable
    static func getGamepadName(_ gamepad: Int32) -> String {
        return String(cString: RaylibC.GetGamepadName(gamepad))
    }
    
    /// Check if a gamepad button has been pressed once
    @inlinable
    static func isGamepadButtonPressed(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = RaylibC.IsGamepadButtonPressed(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a gamepad button is being pressed
    @inlinable
    static func isGamepadButtonDown(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = RaylibC.IsGamepadButtonDown(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a gamepad button has been released once
    @inlinable
    static func isGamepadButtonReleased(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = RaylibC.IsGamepadButtonReleased(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a gamepad button is NOT being pressed
    @inlinable
    static func isGamepadButtonUp(_ gamepad: Int32, _ button: GamepadButton) -> Bool {
        let result = RaylibC.IsGamepadButtonUp(gamepad, button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get the last gamepad button pressed
    @inlinable
    static func getGamepadButtonPressed() -> GamepadButton {
        return GamepadButton(rawValue: RaylibC.GetGamepadButtonPressed()) ?? .unknown
    }
    
    /// Get gamepad axis count for a gamepad
    @inlinable
    static func getGamepadAxisCount(_ gamepad: Int32) -> Int32 {
        return RaylibC.GetGamepadAxisCount(gamepad)
    }
    
    /// Get axis movement value for a gamepad axis
    @inlinable
    static func getGamepadAxisMovement(_ gamepad: Int32, _ axis: GamepadAxis) -> Float {
        return RaylibC.GetGamepadAxisMovement(gamepad, axis.rawValue)
    }
    
    /// Set internal gamepad mappings (SDL_GameControllerDB)
    @inlinable
    static func setGamepadMappings(_ mappings: String) -> Bool {
        return mappings.withCString { cString in
            return RaylibC.SetGamepadMappings(cString) != 0
        }
    }
}


//MARK: - Input-related functions: mouse
public extension Raylib {
    /// Check if a mouse button has been pressed once
    @inlinable
    static func isMouseButtonPressed(_ button: MouseButton) -> Bool {
        let result = RaylibC.IsMouseButtonPressed(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a mouse button is being pressed
    @inlinable
    static func isMouseButtonDown(_ button: MouseButton) -> Bool {
        let result = RaylibC.IsMouseButtonDown(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a mouse button has been released once
    @inlinable
    static func isMouseButtonReleased(_ button: MouseButton) -> Bool {
        let result = RaylibC.IsMouseButtonReleased(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if a mouse button is NOT being pressed
    @inlinable
    static func isMouseButtonUp(_ button: MouseButton) -> Bool {
        let result = RaylibC.IsMouseButtonUp(button.rawValue)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get mouse position X
    @inlinable
    static func getMouseX() -> Int32 {
        return RaylibC.GetMouseX()
    }
    
    /// Get mouse position Y
    @inlinable
    static func getMouseY() -> Int32 {
        return RaylibC.GetMouseY()
    }
    
    /// Get mouse position XY
    @inlinable
    static func getMousePosition() -> Vector2 {
        return RaylibC.GetMousePosition()
    }
    
    /// Set mouse position XY
    @inlinable
    static func setMousePosition(_ x: Int32, _ y: Int32) {
        RaylibC.SetMousePosition(x, y)
    }
    
    /// Set mouse offset
    @inlinable
    static func setMouseOffset(_ offsetX: Int32, _ offsetY: Int32) {
        RaylibC.SetMouseOffset(offsetX, offsetY)
    }
    
    /// Set mouse scaling
    @inlinable
    static func setMouseScale(_ scaleX: Float, _ scaleY: Float) {
        RaylibC.SetMouseScale(scaleX, scaleY)
    }
    
    /// Get mouse wheel movement Y
    @inlinable
    static func getMouseWheelMove() -> Float {
        return RaylibC.GetMouseWheelMove()
    }
    
    /// Set mouse cursor
    @inlinable
    static func setMouseCursor(_ cursor: MouseCursor) {
        RaylibC.SetMouseCursor(cursor.rawValue)
    }
}


//MARK: - Input-related functions: touch
public extension Raylib {
    /// Get touch position X for touch point 0 (relative to screen size)
    @inlinable
    static func getTouchX() -> Int32 {
        return RaylibC.GetTouchX()
    }
    
    /// Get touch position Y for touch point 0 (relative to screen size)
    @inlinable
    static func getTouchY() -> Int32 {
        return RaylibC.GetTouchY()
    }
    
    /// Get touch position XY for a touch point index (relative to screen size)
    @inlinable
    static func getTouchPosition(_ index: Int32) -> Vector2 {
        return RaylibC.GetTouchPosition(index)
    }
    
    /// Get touch point identifier for given index
    @inlinable
    static func getTouchPointId(_ index: Int32) -> Int32 {
        return RaylibC.GetTouchPointId(index)
    }
    
    /// Get number of touch points
    @inlinable
    static func getTouchPointCount() -> Int32 {
        return RaylibC.GetTouchPointCount()
    }
}
