/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import _RaylibC

public extension Raylib {
    //------------------------------------------------------------------------------------
    // Basic Shapes Drawing Functions (Module: shapes)
    //------------------------------------------------------------------------------------
    
    /// Set texture and rectangle to be used on shapes drawing
    /// - NOTE: It can be useful when using basic shapes and one single font, defining a font char white rectangle would allow drawing everything in a single draw call
    @_transparent
    static func setShapesTexture(_ texture: Texture2D, _ source: Rectangle) {
        _RaylibC.SetShapesTexture(texture, source)
    }
    
    //MARK: - Basic shapes drawing functions
    
    /// Draw a pixel
    @_transparent
    static func drawPixel(_ posX: Int32, _ posY: Int32, _ color: Color) {
        _RaylibC.DrawPixel(posX, posY, color)
    }
    
    /// Draw a pixel (Vector version)
    @_transparent
    static func drawPixelV(_ position: Vector2, _ color: Color) {
        _RaylibC.DrawPixelV(position, color)
    }
    
    /// Draw a line
    @_transparent
    static func drawLine(_ startPosX: Int32, _ startPosY: Int32, _ endPosX: Int32, _ endPosY: Int32, _ color: Color) {
        _RaylibC.DrawLine(startPosX, startPosY, endPosX, endPosY, color)
    }
    
    /// Draw a line (Vector version)
    @_transparent
    static func drawLineV(_ startPos: Vector2, _ endPos: Vector2, _ color: Color) {
        _RaylibC.DrawLineV(startPos, endPos, color)
    }
    
    /// Draw a line defining thickness
    @_transparent
    static func drawLineEx(_ startPos: Vector2, _ endPos: Vector2, _ thick: Float, _ color: Color) {
        _RaylibC.DrawLineEx(startPos, endPos, thick, color)
    }
    
    /// Draw a line using cubic-bezier curves in-out
    @_transparent
    static func drawLineBezier(_ startPos: Vector2, _ endPos: Vector2, _ thick: Float, _ color: Color) {
        _RaylibC.DrawLineBezier(startPos, endPos, thick, color)
    }
    
    ///Draw line using quadratic bezier curves with a control point
    @_transparent
    static func drawLineBezierQuad(_ startPos: Vector2, _ endPos: Vector2, _ controlPos: Vector2, _ thick: Float, _ color: Color) {
        _RaylibC.DrawLineBezierQuad(startPos, endPos, controlPos, thick, color)
    }
    
    /// Draw lines sequence
    @_transparent
    static func drawLineStrip(_ points: [Vector2], _ color: Color) {
        var _points = points
        _points.withUnsafeMutableBufferPointer { bufferPointer in
            _RaylibC.DrawLineStrip(bufferPointer.baseAddress, Int32(points.count), color)
        }
    }
    
    /// Draw a color-filled circle
    @_transparent
    static func drawCircle(_ centerX: Int32, _ centerY: Int32, _ radius: Float, _ color: Color) {
        _RaylibC.DrawCircle(centerX, centerY, radius, color)
    }
    
    /// Draw a piece of a circle
    @_transparent
    static func drawCircleSector(_ center: Vector2, _ radius: Float, _ startAngle: Float, _ endAngle: Float, _ segments: Int32, _ color: Color) {
        _RaylibC.DrawCircleSector(center, radius, startAngle, endAngle, segments, color)
    }
    
    /// Draw circle sector outline
    @_transparent
    static func drawCircleSectorLines(_ center: Vector2, _ radius: Float, _ startAngle: Float, _ endAngle: Float, _ segments: Int32, _ color: Color) {
        _RaylibC.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
    }
    
    /// Draw a gradient-filled circle
    @_transparent
    static func drawCircleGradient(_ centerX: Int32, _ centerY: Int32, _ radius: Float, _ color1: Color, _ color2: Color) {
        _RaylibC.DrawCircleGradient(centerX, centerY, radius, color1, color2)
    }
    
    /// Draw a color-filled circle (Vector version)
    @_transparent
    static func drawCircleV(_ center: Vector2, _ radius: Float, _ color: Color) {
        _RaylibC.DrawCircleV(center, radius, color)
    }
    
    /// Draw circle outline
    @_transparent
    static func drawCircleLines(_ centerX: Int32, _ centerY: Int32, _ radius: Float, _ color: Color) {
        _RaylibC.DrawCircleLines(centerX, centerY, radius, color)
    }
    
    /// Draw ellipse
    @_transparent
    static func drawEllipse(_ centerX: Int32, _ centerY: Int32, _ radiusH: Float, _ radiusV: Float, _ color: Color) {
        _RaylibC.DrawEllipse(centerX, centerY, radiusH, radiusV, color)
    }
    
    /// Draw ellipse outline
    @_transparent
    static func drawEllipseLines(_ centerX: Int32, _ centerY: Int32, _ radiusH: Float, _ radiusV: Float, _ color: Color) {
        _RaylibC.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color)
    }
    
    /// Draw ring
    @_transparent
    static func drawRing(_ center: Vector2, _ innerRadius: Float, _ outerRadius: Float, _ startAngle: Float, _ endAngle: Float, _ segments: Int32, _ color: Color) {
        _RaylibC.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
    }
    
    /// Draw ring outline
    @_transparent
    static func drawRingLines(_ center: Vector2, _ innerRadius: Float, _ outerRadius: Float, _ startAngle: Float, _ endAngle: Float, _ segments: Int32, _ color: Color) {
        _RaylibC.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
    }
    
    /// Draw a color-filled rectangle
    @_transparent
    static func drawRectangle(_ posX: Int32, _ posY: Int32, _ width: Int32, _ height: Int32, _ color: Color) {
        _RaylibC.DrawRectangle(posX, posY, width, height, color)
    }
    
    /// Draw a color-filled rectangle (Vector version)
    @_transparent
    static func drawRectangleV(_ position: Vector2, _ size: Vector2, _ color: Color) {
        _RaylibC.DrawRectangleV(position, size, color)
    }
    
    /// Draw a color-filled rectangle
    @_transparent
    static func drawRectangleRec(_ rec: Rectangle, _ color: Color) {
        _RaylibC.DrawRectangleRec(rec, color)
    }
    
    /// Draw a color-filled rectangle with pro parameters
    @_transparent
    static func drawRectanglePro(_ rec: Rectangle, _ origin: Vector2, _ rotation: Float, _ color: Color) {
        _RaylibC.DrawRectanglePro(rec, origin, rotation, color)
    }
    
    /// Draw a vertical-gradient-filled rectangle
    @_transparent
    static func drawRectangleGradientV(_ posX: Int32, _ posY: Int32, _ width: Int32, _ height: Int32, _ color1: Color, _ color2: Color) {
        _RaylibC.DrawRectangleGradientV(posX, posY, width, height, color1, color2)
    }
    
    /// Draw a horizontal-gradient-filled rectangle
    @_transparent
    static func drawRectangleGradientH(_ posX: Int32, _ posY: Int32, _ width: Int32, _ height: Int32, _ color1: Color, _ color2: Color) {
        _RaylibC.DrawRectangleGradientH(posX, posY, width, height, color1, color2)
    }
    
    /// Draw a gradient-filled rectangle with custom vertex colors
    @_transparent
    static func drawRectangleGradientEx(_ rec: Rectangle, _ col1: Color, _ col2: Color, _ col3: Color, _ col4: Color) {
        _RaylibC.DrawRectangleGradientEx(rec, col1, col2, col3, col4)
    }
    
    /// Draw rectangle outline
    @_transparent
    static func drawRectangleLines(_ posX: Int32, _ posY: Int32, _ width: Int32, _ height: Int32, _ color: Color) {
        _RaylibC.DrawRectangleLines(posX, posY, width, height, color)
    }
    
    /// Draw rectangle outline with extended parameters
    @_transparent
    static func drawRectangleLinesEx(_ rec: Rectangle, _ lineThick: Int32, _ color: Color) {
        _RaylibC.DrawRectangleLinesEx(rec, lineThick, color)
    }
    
    /// Draw rectangle with rounded edges
    @_transparent
    static func drawRectangleRounded(_ rec: Rectangle, _ roundness: Float, _ segments: Int32, _ color: Color) {
        _RaylibC.DrawRectangleRounded(rec, roundness, segments, color)
    }
    
    /// Draw rectangle with rounded edges outline
    @_transparent
    static func drawRectangleRoundedLines(_ rec: Rectangle, _ roundness: Float, _ segments: Int32, _ lineThick: Int32, _ color: Color) {
        _RaylibC.DrawRectangleRoundedLines(rec, roundness, segments, lineThick, color)
    }
    
    /// Draw a color-filled triangle (vertex in counter-clockwise order!)
    @_transparent
    static func drawTriangle(_ v1: Vector2, _ v2: Vector2, _ v3: Vector2, _ color: Color) {
        _RaylibC.DrawTriangle(v1, v2, v3, color)
    }
    
    /// Draw triangle outline (vertex in counter-clockwise order!)
    @_transparent
    static func drawTriangleLines(_ v1: Vector2, _ v2: Vector2, _ v3: Vector2, _ color: Color) {
        _RaylibC.DrawTriangleLines(v1, v2, v3, color)
    }
    
    /// Draw a triangle fan defined by points (first vertex is the center)
    @_transparent
    static func drawTriangleFan(_ points: [Vector2],_ color: Color) {
        var _points = points
        _points.withUnsafeMutableBufferPointer { bufferPointer in
            _RaylibC.DrawTriangleFan(bufferPointer.baseAddress, Int32(points.count), color)
        }
    }
    
    /// Draw a triangle strip defined by points
    @_transparent
    static func drawTriangleStrip(_ points: [Vector2], _ color: Color) {
        var _points = points
        _points.withUnsafeMutableBufferPointer { bufferPointer in
            _RaylibC.DrawTriangleStrip(bufferPointer.baseAddress, Int32(points.count), color)
        }
    }
    
    /// Draw a regular polygon (Vector version)
    @_transparent
    static func drawPoly(_ center: Vector2, _ sides: Int32, _ radius: Float, _ rotation: Float, _ color: Color) {
        _RaylibC.DrawPoly(center, sides, radius, rotation, color)
    }
    
    /// Draw a polygon outline of n sides
    @_transparent
    static func drawPolyLines(_ center: Vector2, _ sides: Int32, _ radius: Float, _ rotation: Float, _ color: Color) {
        _RaylibC.DrawPolyLines(center, sides, radius, rotation, color)
    }
    
    //MARK: - Basic shapes collision detection functions
    
    /// Check collision between two rectangles
    @_transparent
    static func checkCollisionRecs(_ rec1: Rectangle, _ rec2: Rectangle) -> Bool {
        let result = _RaylibC.CheckCollisionRecs(rec1, rec2)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check collision between two circles
    @_transparent
    static func checkCollisionCircles(_ center1: Vector2, _ radius1: Float, _ center2: Vector2, _ radius2: Float) -> Bool {
        let result = _RaylibC.CheckCollisionCircles(center1, radius1, center2, radius2)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check collision between circle and rectangle
    @_transparent
    static func checkCollisionCircleRec(_ center: Vector2, _ radius: Float, _ rec: Rectangle) -> Bool {
        let result = _RaylibC.CheckCollisionCircleRec(center, radius, rec)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if point is inside rectangle
    @_transparent
    static func checkCollisionPointRec(_ point: Vector2, _ rec: Rectangle) -> Bool {
        let result = _RaylibC.CheckCollisionPointRec(point, rec)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if point is inside circle
    @_transparent
    static func checkCollisionPointCircle(_ point: Vector2, _ center: Vector2, _ radius: Float) -> Bool {
        let result = _RaylibC.CheckCollisionPointCircle(point, center, radius)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if point is inside a triangle
    @_transparent
    static func checkCollisionPointTriangle(_ point: Vector2, _ p1: Vector2, _ p2: Vector2, _ p3: Vector2) -> Bool {
        let result = _RaylibC.CheckCollisionPointTriangle(point, p1, p2, p3)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check the collision between two lines defined by two points each, returns collision point by reference
    @_transparent
    static func checkCollisionLines(_ startPos1: Vector2, _ endPos1: Vector2, _ startPos2: Vector2, _ endPos2: Vector2) -> Vector2? {
        var collisionPoint = Vector2()
        let result = _RaylibC.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, &collisionPoint)
#if os(Windows)
        if result.rawValue != 0 {
            return collisionPoint
        }
#else
        if result {
            return collisionPoint
        }
#endif
        return nil
    }
    
    /// Get collision rectangle for two rectangles collision
    @_transparent
    static func getCollisionRec(_ rec1: Rectangle, _ rec2: Rectangle) -> Rectangle {
        return _RaylibC.GetCollisionRec(rec1, rec2)
    }
}
