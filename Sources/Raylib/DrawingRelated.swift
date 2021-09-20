/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import _RaylibC

public extension Raylib {
    // Drawing-related functions
    
    /// Set background color (framebuffer clear color)
    @_transparent
    static func clearBackground(_ color: Color) {
        _RaylibC.ClearBackground(color)
    }
    
    /// Setup canvas (framebuffer) to start drawing
    @_transparent
    static func beginDrawing() {
        _RaylibC.BeginDrawing()
    }
    
    /// End canvas drawing and swap buffers (double buffering)
    @_transparent
    static func endDrawing() {
        _RaylibC.EndDrawing()
    }
    
    /// Initialize 2D mode with custom camera (2D)
    @_transparent
    static func beginMode2D(_ camera: Camera2D) {
        _RaylibC.BeginMode2D(camera)
    }
    
    /// Ends 2D mode with custom camera
    @_transparent
    static func endMode2D() {
        _RaylibC.EndMode2D()
    }
    
    /// Initializes 3D mode with custom camera (3D)
    @_transparent
    static func beginMode3D(_ camera: Camera3D) {
        _RaylibC.BeginMode3D(camera)
    }
    
    /// Ends 3D mode and returns to default 2D orthographic mode
    @_transparent
    static func endMode3D() {
        _RaylibC.EndMode3D()
    }
    
    /// Initializes render texture for drawing
    @_transparent
    static func beginTextureMode(_ target: RenderTexture2D) {
        _RaylibC.BeginTextureMode(target)
    }
    
    /// Ends drawing to render texture
    @_transparent
    static func endTextureMode() {
        _RaylibC.EndTextureMode()
    }
    
    /// Begin custom shader drawing
    @_transparent
    static func beginShaderMode(_ shader: Shader) {
        _RaylibC.BeginShaderMode(shader)
    }
    
    /// End custom shader drawing (use default shader)
    @_transparent
    static func endShaderMode() {
        _RaylibC.EndShaderMode()
    }
    
    /// Begin blending mode (alpha, additive, multiplied)
    @_transparent
    static func beginBlendMode(_ mode: BlendMode) {
        _RaylibC.BeginBlendMode(mode.rawValue)
    }
    
    /// End blending mode (reset to default: alpha blending)
    @_transparent
    static func endBlendMode() {
        _RaylibC.EndBlendMode()
    }
    
    /// Begin scissor mode (define screen area for following drawing)
    @_transparent
    static func beginScissorMode(_ x: Int32, _ y: Int32, _ width: Int32, _ height: Int32) {
        _RaylibC.BeginScissorMode(x, y, width, height)
    }
    
    /// End scissor mode
    @_transparent
    static func endScissorMode() {
        _RaylibC.EndScissorMode()
    }
    
    /// Begin stereo rendering (requires VR simulator)
    @_transparent
    static func beginVrStereoMode(_ config: VrStereoConfig) {
        _RaylibC.BeginVrStereoMode(config)
    }
    
    /// End stereo rendering (requires VR simulator)
    @_transparent
    static func endVrStereoMode() {
        _RaylibC.EndVrStereoMode()
    }
}
