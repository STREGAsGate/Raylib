/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// This file contains deprecations for SwiftRaylib from Raylib 3.7 to 4.0
// Swift will guide you through upgrading, and this file contains the hints it needs to do so.

import _RaylibC


//MARK: - Raylib.swift
public extension Raylib {
    /// Detect collision between ray and box
    @available(*, unavailable, renamed: "getRayCollisionBox()")
    @inlinable
    static func checkCollisionRayBox(_ ray: Ray, _ box: BoundingBox) -> Bool {
        fatalError()
    }
    
    @available(*, deprecated, renamed: "Self.raylibVersion")
    @inlinable
    var version: String {
        return Self.raylibVersion
    }
}


//MARK: - Image.swift
public extension Raylib {
    /// Generate image: perlin noise
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    init(perlinNoiseScale scale: Float, width: Int32, height: Int32, offsetX: Int32, offsetY: Int32) {
        fatalError()
    }
}


//MARK: - raylib_h_models.swift
public extension Raylib {
    /// Get collision info between ray and mesh
    @available(*, unavailable, renamed: "getRayCollisionMesh()")
    @inlinable
    static func getCollisionRayMesh(_ ray: Ray, _ mesh: Mesh, _ transform: Matrix) -> RayCollision {
        fatalError()
    }
    
    /// Get collision info between ray and model
    @available(*, unavailable, renamed: "getRayCollisionModel()")
    @inlinable
    static func getCollisionRayModel(_ ray: Ray, _ model: Model) -> RayCollision {
        fatalError()
    }
    
    /// Get collision info between ray and triangle
    @available(*, unavailable, renamed: "getRayCollisionTriangle()")
    @inlinable
    static func getCollisionRayTriangle(_ ray: Ray, _ p1: Vector3, _ p2: Vector3, _ p3: Vector3) -> RayCollision {
        fatalError()
    }
    
    /// Get collision info between ray and ground plane (Y-normal plane)
    @available(*, unavailable, renamed: "getRayCollisionQuad()")
    @inlinable
    static func getCollisionRayGround(_ ray: Ray, _ groundHeight: Float) -> RayCollision {
        fatalError()
    }
    
    /// Compute mesh bounding box limits
    @available(*, deprecated, renamed: "getMeshBoundingBox()")
    @inlinable
    static func meshBoundingBox(_ mesh: Mesh) -> BoundingBox {
        return _RaylibC.GetMeshBoundingBox(mesh)
    }
    
    /// Compute mesh tangents
    @available(*, deprecated, renamed: "genMeshTangents()")
    @inlinable
    static func meshTangents(_ mesh: inout Mesh) {
        _RaylibC.GenMeshTangents(&mesh)
    }
    
    /// Compute mesh binormals
    @available(*, deprecated, renamed: "genMeshBinormals()")
    @inlinable
    static func meshBinormals(_ mesh: inout Mesh) {
        _RaylibC.GenMeshBinormals(&mesh)
    }
    
    /// Detect collision between ray and sphere
    @available(*, deprecated, message: "Use getRayCollisionSphere()")
    @inlinable
    static func checkCollisionRaySphere(_ ray: Ray, _ center: Vector3, _ radius: Float) -> Bool {
        let result = _RaylibC.GetRayCollisionSphere(ray, center, radius).hit
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect collision between ray and sphere, returns collision point
    @available(*, deprecated, message: "Use getRayCollisionSphere()")
    @inlinable
    static func checkCollisionRaySphereEx(_ ray: Ray, _ center: Vector3, _ radius: Float) -> Vector3? {
        let collision = _RaylibC.GetRayCollisionSphere(ray, center, radius)
#if os(Windows)
        if collision.hit.rawValue != 0 {
            return collision.point
        }
#else
        if collision.hit {
            return collision.point
        }
#endif
        return nil
    }
}


//MARK: - TextureLoadingAndDrawing.swift
public extension Raylib {
    /// Generate image: perlin noise
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    static func genImagePerlinNoise(_ width: Int32, _ height: Int32, _ offsetX: Int32, _ offsetY: Int32, _ scale: Float) -> Image {
        fatalError()
    }
    
    /// Get pixel data from GPU texture and return an Image
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    static func getTextureData(_ texture: Texture2D) -> Image {
        fatalError()
    }
    
    /// Get pixel data from screen buffer and return an Image (screenshot)
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    static func getScreenData() -> Image {
        fatalError()
    }
}


//MARK: - Raylib_h_text.swift
public extension Raylib {
    /// Draw text using font inside rectangle limits
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    static func drawTextRec(_ font: Font, _ text: String, _ rec: Rectangle, _ fontSize: Float, _ spacing: Float, _ wordWrap: Bool, _ tint: Color) {
        fatalError()
    }
    
    /// Draw text using font inside rectangle limits with support for text selection
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    static func drawTextRecEx(_ font: Font, _ text: String, _ rec: Rectangle, _ fontSize: Float, _ spacing: Float, _ wordWrap: Bool, _ tint: Color, _ selectStart: Int32, _ selectLength: Int32, _ selectTint: Color, _ selectBackTint: Color) {
        fatalError()
    }
    
    /// Encode text codepoint into utf8 text (memory must be freed!)
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    static func textToUtf8(_ codepoints: [Int32]) -> String {
        fatalError()
    }
    
    /// Get all codepoints in a string, codepoints count returned by parameters
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    static func getCodepoints(_ text: String) -> [Int32] {
        fatalError()
    }
    
    /// Get total number of characters (codepoints) in a UTF8 encoded string
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    static func getCodepointsCount(_ text: String) -> Int32 {
        fatalError()
    }
    
    /// Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    static func getNextCodepoint(_ text: String, _ bytesProcessed: inout Int32) -> Int32 {
        fatalError()
    }
    
    /// Encode codepoint into utf8 text (char array length returned as parameter)
    @available(*, unavailable, message: "Removed in Raylib 4.0")
    @inlinable
    static func codepointToUtf8(_ codepoint: Int32, _ byteLength: UnsafeMutablePointer<Int32>!) -> UnsafePointer<CChar>! {
        fatalError()
    }
}


//MARK: - Raymath_h.swift

/// Return min value for each pair of components
@available(*, deprecated, renamed: "Vector3.minimum()")
@inlinable
public func min(_ v1: Vector3, _ v2: Vector3) -> Vector3 {
    return _RaylibC.Vector3Min(v1, v2)
}

/// Return max value for each pair of components
@available(*, deprecated, renamed: "Vector3.maximum()")
@inlinable
public func max(_ v1: Vector3, _ v2: Vector3) -> Vector3 {
    return _RaylibC.Vector3Max(v1, v2)
}


//MARK: - Raylib_h_audio.swift
public extension Raylib {
    /// Check if music is playing
    @available(*, deprecated, renamed: "isMusicStreamPlaying()")
    @inlinable
    static func isMusicPlaying(_ music: Music) -> Bool {
        let result = _RaylibC.IsMusicStreamPlaying(music)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Init audio stream (to stream raw audio pcm data)
    @available(*, deprecated, renamed: "loadAudioStream()")
    @inlinable
    static func initAudioStream(_ sampleRate: UInt32, _ sampleSize: UInt32, _ channels: UInt32) -> AudioStream {
        return _RaylibC.LoadAudioStream(sampleRate, sampleSize, channels)
    }
    
    /// Close audio stream and free memory
    @available(*, deprecated, renamed: "unloadAudioStream()")
    @inlinable
    static func closeAudioStream(_ stream: AudioStream) {
        _RaylibC.UnloadAudioStream(stream)
    }
}

//MARK: - Raylib_h_core.swift
public extension Raylib {
    /// Check gamepad name (if available)
    @available(*, unavailable, message: "Removed in Raylib 4.0.0")
    @inlinable
    static func isGamepadName(_ gamepad: Int32, _ name: String) -> Bool {
        fatalError()
    }
    
    /// Get touch points count
    @available(*, deprecated, renamed: "getTouchPointCount()")
    @inlinable
    static func getTouchPointsCount() -> Int32 {
        return _RaylibC.GetTouchPointCount()
    }
}


//MARK: - raygui_h.swift
public extension Raylib {
    @available(*, deprecated, renamed: "isGuiLocked")
    @inlinable
    static func guiIsLocked() -> Bool {
        fatalError()
    }
    
    @available(*, deprecated, renamed: "guiState")
    @inlinable
    static func guiGetState() -> Bool {
        fatalError()
    }
}
