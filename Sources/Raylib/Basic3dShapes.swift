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
    // Basic 3d Shapes Drawing Functions (Module: models)
    //------------------------------------------------------------------------------------
    
    //MARK: - Basic geometric 3D shapes drawing functions
    
    
    /// Draw a line in 3D world space
    @_transparent
    static func drawLine3D(_ startPos: Vector3, _ endPos: Vector3, _ color: Color) {
        _RaylibC.DrawLine3D(startPos, endPos, color)
    }
    
    /// Draw a point in 3D space, actually a small line
    @_transparent
    static func drawPoint3D(_ position: Vector3, _ color: Color) {
        _RaylibC.DrawPoint3D(position, color)
    }
    
    /// Draw a circle in 3D world space
    @_transparent
    static func drawCircle3D(_ center: Vector3, _ radius: Float, _ rotationAxis: Vector3, _ rotationAngle: Float, _ color: Color) {
        _RaylibC.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color)
    }
    
    /// Draw a color-filled triangle (vertex in counter-clockwise order!)
    @_transparent
    static func drawTriangle3D(_ v1: Vector3, _ v2: Vector3, _ v3: Vector3, _ color: Color) {
        _RaylibC.DrawTriangle3D(v1, v2, v3, color)
    }
    
    /// Draw a triangle strip defined by points
    @_transparent
    static func drawTriangleStrip3D(_ points: [Vector3], _ color: Color) {
        var _points = points
        _points.withUnsafeMutableBufferPointer { bufferPointer in
            _RaylibC.DrawTriangleStrip3D(bufferPointer.baseAddress, Int32(points.count), color)
        }
    }
    
    /// Draw cube
    @_transparent
    static func drawCube(_ position: Vector3, _ width: Float, _ height: Float, _ length: Float, _ color: Color) {
        _RaylibC.DrawCube(position, width, height, length, color)
    }
    
    /// Draw cube (Vector version)
    @_transparent
    static func drawCubeV(_ position: Vector3, _ size: Vector3, _ color: Color) {
        _RaylibC.DrawCubeV(position, size, color)
    }
    
    /// Draw cube wires
    @_transparent
    static func drawCubeWires(_ position: Vector3, _ width: Float, _ height: Float, _ length: Float, _ color: Color) {
        _RaylibC.DrawCubeWires(position, width, height, length, color)
    }
    
    /// Draw cube wires (Vector version)
    @_transparent
    static func drawCubeWiresV(_ position: Vector3, _ size: Vector3, _ color: Color) {
        _RaylibC.DrawCubeWiresV(position, size, color)
    }
    
    /// Draw cube textured
    @_transparent
    static func drawCubeTexture(_ texture: Texture2D, _ position: Vector3, _ width: Float, _ height: Float, _ length: Float, _ color: Color) {
        _RaylibC.DrawCubeTexture(texture, position, width, height, length, color)
    }
    
    /// Draw sphere
    @_transparent
    static func drawSphere(_ centerPos: Vector3, _ radius: Float, _ color: Color) {
        _RaylibC.DrawSphere(centerPos, radius, color)
    }
    
    /// Draw sphere with extended parameters
    @_transparent
    static func drawSphereEx(_ centerPos: Vector3, _ radius: Float, _ rings: Int32, _ slices: Int32, _ color: Color) {
        _RaylibC.DrawSphereEx(centerPos, radius, rings, slices, color)
    }
    
    /// Draw sphere wires
    @_transparent
    static func drawSphereWires(_ centerPos: Vector3, _ radius: Float, _ rings: Int32, _ slices: Int32, _ color: Color) {
        _RaylibC.DrawSphereWires(centerPos, radius, rings, slices, color)
    }
    
    /// Draw a cylinder/cone
    @_transparent
    static func drawCylinder(_ position: Vector3, _ radiusTop: Float, _ radiusBottom: Float, _ height: Float, _ slices: Int32, _ color: Color) {
        _RaylibC.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color)
    }
    
    /// Draw a cylinder/cone wires
    @_transparent
    static func drawCylinderWires(_ position: Vector3, _ radiusTop: Float, _ radiusBottom: Float, _ height: Float, _ slices: Int32, _ color: Color) {
        _RaylibC.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color)
    }
    
    /// Draw a plane XZ
    @_transparent
    static func drawPlane(_ centerPos: Vector3, _ size: Vector2, _ color: Color) {
        _RaylibC.DrawPlane(centerPos, size, color)
    }
    
    /// Draw a ray line
    @_transparent
    static func drawRay(_ ray: Ray, _ color: Color) {
        _RaylibC.DrawRay(ray, color)
    }
    
    /// Draw a grid (centered at (0, 0, 0))
    @_transparent
    static func drawGrid(_ slices: Int32, _ spacing: Float) {
        _RaylibC.DrawGrid(slices, spacing)
    }
}
