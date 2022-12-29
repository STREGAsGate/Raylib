/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import RaylibC

//------------------------------------------------------------------------------------
// Basic Shapes Drawing Functions (Module: shapes)
//------------------------------------------------------------------------------------
public extension Raylib {
    /// Set texture and rectangle to be used on shapes drawing
    /// - NOTE: It can be useful when using basic shapes and one single font, defining a font char white rectangle would allow drawing everything in a single draw call
    @inlinable
    static func setShapesTexture(_ texture: Texture2D, _ source: Rectangle) {
        RaylibC.SetShapesTexture(texture, source)
    }
    
    //MARK: - Basic shapes drawing functions
    
    /// Draw a pixel
    @inlinable
    static func drawPixel(_ posX: Int32, _ posY: Int32, _ color: Color) {
        RaylibC.DrawPixel(posX, posY, color)
    }
    
    /// Draw a pixel (Vector version)
    @inlinable
    static func drawPixelV(_ position: Vector2, _ color: Color) {
        RaylibC.DrawPixelV(position, color)
    }
    
    /// Draw a line
    @inlinable
    static func drawLine(_ startPosX: Int32, _ startPosY: Int32, _ endPosX: Int32, _ endPosY: Int32, _ color: Color) {
        RaylibC.DrawLine(startPosX, startPosY, endPosX, endPosY, color)
    }
    
    /// Draw a line (Vector version)
    @inlinable
    static func drawLineV(_ startPos: Vector2, _ endPos: Vector2, _ color: Color) {
        RaylibC.DrawLineV(startPos, endPos, color)
    }
    
    /// Draw a line defining thickness
    @inlinable
    static func drawLineEx(_ startPos: Vector2, _ endPos: Vector2, _ thick: Float, _ color: Color) {
        RaylibC.DrawLineEx(startPos, endPos, thick, color)
    }
    
    /// Draw a line using cubic-bezier curves in-out
    @inlinable
    static func drawLineBezier(_ startPos: Vector2, _ endPos: Vector2, _ thick: Float, _ color: Color) {
        RaylibC.DrawLineBezier(startPos, endPos, thick, color)
    }
    
    /// Draw line using quadratic bezier curves with a control point
    @inlinable
    static func drawLineBezierQuad(_ startPos: Vector2, _ endPos: Vector2, _ controlPos: Vector2, _ thick: Float, _ color: Color) {
        RaylibC.DrawLineBezierQuad(startPos, endPos, controlPos, thick, color)
    }
    
    /// Draw line using cubic bezier curves with 2 control points
    @inlinable
    static func drawLineBezierCubic(_ startPos: Vector2, _ endPos: Vector2, _ startControlPos: Vector2, _ endControlPos: Vector2, _ thick: Float, _ color: Color) {
        RaylibC.DrawLineBezierCubic(startPos, endPos, startControlPos, endControlPos, thick, color)
    }
    
    /// Draw lines sequence
    @inlinable
    static func drawLineStrip(_ points: [Vector2], _ color: Color) {
        var _points = points
        _points.withUnsafeMutableBufferPointer { bufferPointer in
            RaylibC.DrawLineStrip(bufferPointer.baseAddress, Int32(points.count), color)
        }
    }
    
    /// Draw a color-filled circle
    @inlinable
    static func drawCircle(_ centerX: Int32, _ centerY: Int32, _ radius: Float, _ color: Color) {
        RaylibC.DrawCircle(centerX, centerY, radius, color)
    }
    
    /// Draw a piece of a circle
    @inlinable
    static func drawCircleSector(_ center: Vector2, _ radius: Float, _ startAngle: Float, _ endAngle: Float, _ segments: Int32, _ color: Color) {
        RaylibC.DrawCircleSector(center, radius, startAngle, endAngle, segments, color)
    }
    
    /// Draw circle sector outline
    @inlinable
    static func drawCircleSectorLines(_ center: Vector2, _ radius: Float, _ startAngle: Float, _ endAngle: Float, _ segments: Int32, _ color: Color) {
        RaylibC.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
    }
    
    /// Draw a gradient-filled circle
    @inlinable
    static func drawCircleGradient(_ centerX: Int32, _ centerY: Int32, _ radius: Float, _ color1: Color, _ color2: Color) {
        RaylibC.DrawCircleGradient(centerX, centerY, radius, color1, color2)
    }
    
    /// Draw a color-filled circle (Vector version)
    @inlinable
    static func drawCircleV(_ center: Vector2, _ radius: Float, _ color: Color) {
        RaylibC.DrawCircleV(center, radius, color)
    }
    
    /// Draw circle outline
    @inlinable
    static func drawCircleLines(_ centerX: Int32, _ centerY: Int32, _ radius: Float, _ color: Color) {
        RaylibC.DrawCircleLines(centerX, centerY, radius, color)
    }
    
    /// Draw ellipse
    @inlinable
    static func drawEllipse(_ centerX: Int32, _ centerY: Int32, _ radiusH: Float, _ radiusV: Float, _ color: Color) {
        RaylibC.DrawEllipse(centerX, centerY, radiusH, radiusV, color)
    }
    
    /// Draw ellipse outline
    @inlinable
    static func drawEllipseLines(_ centerX: Int32, _ centerY: Int32, _ radiusH: Float, _ radiusV: Float, _ color: Color) {
        RaylibC.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color)
    }
    
    /// Draw ring
    @inlinable
    static func drawRing(_ center: Vector2, _ innerRadius: Float, _ outerRadius: Float, _ startAngle: Float, _ endAngle: Float, _ segments: Int32, _ color: Color) {
        RaylibC.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
    }
    
    /// Draw ring outline
    @inlinable
    static func drawRingLines(_ center: Vector2, _ innerRadius: Float, _ outerRadius: Float, _ startAngle: Float, _ endAngle: Float, _ segments: Int32, _ color: Color) {
        RaylibC.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
    }
    
    /// Draw a color-filled rectangle
    @inlinable
    static func drawRectangle(_ posX: Int32, _ posY: Int32, _ width: Int32, _ height: Int32, _ color: Color) {
        RaylibC.DrawRectangle(posX, posY, width, height, color)
    }
    
    /// Draw a color-filled rectangle (Vector version)
    @inlinable
    static func drawRectangleV(_ position: Vector2, _ size: Vector2, _ color: Color) {
        RaylibC.DrawRectangleV(position, size, color)
    }
    
    /// Draw a color-filled rectangle
    @inlinable
    static func drawRectangleRec(_ rec: Rectangle, _ color: Color) {
        RaylibC.DrawRectangleRec(rec, color)
    }
    
    /// Draw a color-filled rectangle with pro parameters
    @inlinable
    static func drawRectanglePro(_ rec: Rectangle, _ origin: Vector2, _ rotation: Float, _ color: Color) {
        RaylibC.DrawRectanglePro(rec, origin, rotation, color)
    }
    
    /// Draw a vertical-gradient-filled rectangle
    @inlinable
    static func drawRectangleGradientV(_ posX: Int32, _ posY: Int32, _ width: Int32, _ height: Int32, _ color1: Color, _ color2: Color) {
        RaylibC.DrawRectangleGradientV(posX, posY, width, height, color1, color2)
    }
    
    /// Draw a horizontal-gradient-filled rectangle
    @inlinable
    static func drawRectangleGradientH(_ posX: Int32, _ posY: Int32, _ width: Int32, _ height: Int32, _ color1: Color, _ color2: Color) {
        RaylibC.DrawRectangleGradientH(posX, posY, width, height, color1, color2)
    }
    
    /// Draw a gradient-filled rectangle with custom vertex colors
    @inlinable
    static func drawRectangleGradientEx(_ rec: Rectangle, _ col1: Color, _ col2: Color, _ col3: Color, _ col4: Color) {
        RaylibC.DrawRectangleGradientEx(rec, col1, col2, col3, col4)
    }
    
    /// Draw rectangle outline
    @inlinable
    static func drawRectangleLines(_ posX: Int32, _ posY: Int32, _ width: Int32, _ height: Int32, _ color: Color) {
        RaylibC.DrawRectangleLines(posX, posY, width, height, color)
    }
    
    /// Draw rectangle outline with extended parameters
    @inlinable
    static func drawRectangleLinesEx(_ rec: Rectangle, _ lineThick: Float, _ color: Color) {
        RaylibC.DrawRectangleLinesEx(rec, lineThick, color)
    }
    
    /// Draw rectangle with rounded edges
    @inlinable
    static func drawRectangleRounded(_ rec: Rectangle, _ roundness: Float, _ segments: Int32, _ color: Color) {
        RaylibC.DrawRectangleRounded(rec, roundness, segments, color)
    }
    
    /// Draw rectangle with rounded edges outline
    @inlinable
    static func drawRectangleRoundedLines(_ rec: Rectangle, _ roundness: Float, _ segments: Int32, _ lineThick: Float, _ color: Color) {
        RaylibC.DrawRectangleRoundedLines(rec, roundness, segments, lineThick, color)
    }
    
    /// Draw a color-filled triangle (vertex in counter-clockwise order!)
    @inlinable
    static func drawTriangle(_ v1: Vector2, _ v2: Vector2, _ v3: Vector2, _ color: Color) {
        RaylibC.DrawTriangle(v1, v2, v3, color)
    }
    
    /// Draw triangle outline (vertex in counter-clockwise order!)
    @inlinable
    static func drawTriangleLines(_ v1: Vector2, _ v2: Vector2, _ v3: Vector2, _ color: Color) {
        RaylibC.DrawTriangleLines(v1, v2, v3, color)
    }
    
    /// Draw a triangle fan defined by points (first vertex is the center)
    @inlinable
    static func drawTriangleFan(_ points: [Vector2], _ color: Color) {
        var _points = points
        _points.withUnsafeMutableBufferPointer { bufferPointer in
            RaylibC.DrawTriangleFan(bufferPointer.baseAddress, Int32(points.count), color)
        }
    }
    
    /// Draw a triangle strip defined by points
    @inlinable
    static func drawTriangleStrip(_ points: [Vector2], _ color: Color) {
        var _points = points
        _points.withUnsafeMutableBufferPointer { bufferPointer in
            RaylibC.DrawTriangleStrip(bufferPointer.baseAddress, Int32(points.count), color)
        }
    }
    
    /// Draw a regular polygon (Vector version)
    @inlinable
    static func drawPoly(_ center: Vector2, _ sides: Int32, _ radius: Float, _ rotation: Float, _ color: Color) {
        RaylibC.DrawPoly(center, sides, radius, rotation, color)
    }
    
    /// Draw a polygon outline of n sides
    @inlinable
    static func drawPolyLines(_ center: Vector2, _ sides: Int32, _ radius: Float, _ rotation: Float, _ color: Color) {
        RaylibC.DrawPolyLines(center, sides, radius, rotation, color)
    }
    
    /// Draw a polygon outline of n sides with extended parameters
    @inlinable
    static func drawPolyLinesEx(_ center: Vector2, _ sides: Int32, _ radius: Float, _ rotation: Float, _ lineThick: Float, _ color: Color) {
        RaylibC.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color)
    }
}


//MARK: - Basic shapes collision detection functions
public extension Raylib {
    /// Check collision between two rectangles
    @inlinable
    static func checkCollisionRecs(_ rec1: Rectangle, _ rec2: Rectangle) -> Bool {
        let result = RaylibC.CheckCollisionRecs(rec1, rec2)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check collision between two circles
    @inlinable
    static func checkCollisionCircles(_ center1: Vector2, _ radius1: Float, _ center2: Vector2, _ radius2: Float) -> Bool {
        let result = RaylibC.CheckCollisionCircles(center1, radius1, center2, radius2)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check collision between circle and rectangle
    @inlinable
    static func checkCollisionCircleRec(_ center: Vector2, _ radius: Float, _ rec: Rectangle) -> Bool {
        let result = RaylibC.CheckCollisionCircleRec(center, radius, rec)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if point is inside rectangle
    @inlinable
    static func checkCollisionPointRec(_ point: Vector2, _ rec: Rectangle) -> Bool {
        let result = RaylibC.CheckCollisionPointRec(point, rec)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if point is inside circle
    @inlinable
    static func checkCollisionPointCircle(_ point: Vector2, _ center: Vector2, _ radius: Float) -> Bool {
        let result = RaylibC.CheckCollisionPointCircle(point, center, radius)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check if point is inside a triangle
    @inlinable
    static func checkCollisionPointTriangle(_ point: Vector2, _ p1: Vector2, _ p2: Vector2, _ p3: Vector2) -> Bool {
        let result = RaylibC.CheckCollisionPointTriangle(point, p1, p2, p3)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check the collision between two lines defined by two points each, returns collision point by reference
    @inlinable
    static func checkCollisionLines(_ startPos1: Vector2, _ endPos1: Vector2, _ startPos2: Vector2, _ endPos2: Vector2) -> Vector2? {
        var collisionPoint = Vector2()
        let result = RaylibC.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, &collisionPoint)
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
    
    /// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
    @inlinable
    static func checkCollisionPointLine(_ point: Vector2, _ p1: Vector2, _ p2: Vector2, _ threshold: Int32) -> Bool {
        let result = RaylibC.CheckCollisionPointLine(point, p1, p2, threshold)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get collision rectangle for two rectangles collision
    @inlinable
    static func getCollisionRec(_ rec1: Rectangle, _ rec2: Rectangle) -> Rectangle {
        return RaylibC.GetCollisionRec(rec1, rec2)
    }
}
