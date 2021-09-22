/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Raylib {
    //MARK: - Screen-space-related functions
    
    /// Returns a ray trace from mouse position
    @_transparent
    static func getMouseRay(_ mousePosition: Vector2, _ camera: Camera) -> Ray {
        return _RaylibC.GetMouseRay(mousePosition, camera)
    }
    
    /// Returns camera transform matrix (view matrix)
    @_transparent
    static func getCameraMatrix(_ camera: Camera) -> Matrix {
        return _RaylibC.GetCameraMatrix(camera)
    }
    
    /// Returns camera 2d transform matrix
    @_transparent
    static func getCameraMatrix2D(_ camera: Camera2D) -> Matrix {
        return _RaylibC.GetCameraMatrix2D(camera)
    }
    
    /// Returns the screen space position for a 3d world space position
    @_transparent
    static func getWorldToScreen(_ position: Vector3, _ camera: Camera) -> Vector2 {
        return _RaylibC.GetWorldToScreen(position, camera)
    }
    
    /// Returns size position for a 3d world space position
    @_transparent
    static func getWorldToScreenEx(_ position: Vector3, _ camera: Camera, _ width: Int32, _ height: Int32) -> Vector2 {
        return _RaylibC.GetWorldToScreenEx(position, camera, width, height)
    }
    
    /// Returns the screen space position for a 2d camera world space position
    @_transparent
    static func getWorldToScreen2D(_ position: Vector2, _ camera: Camera2D) -> Vector2 {
        return _RaylibC.GetWorldToScreen2D(position, camera)
    }
    
    /// Returns the world space position for a 2d camera screen space position
    @_transparent
    static func getScreenToWorld2D(_ position: Vector2, _ camera: Camera2D) -> Vector2 {
        return _RaylibC.GetScreenToWorld2D(position, camera)
    }
}
