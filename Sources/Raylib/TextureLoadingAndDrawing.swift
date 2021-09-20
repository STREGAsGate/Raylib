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
    // Texture Loading and Drawing Functions (Module: textures)
    //------------------------------------------------------------------------------------
    
    //MARK: - Image loading functions
    // NOTE: This functions do not require GPU access
    
    /// Load image from file into CPU memory (RAM)
    @_transparent
    static func loadImage(_ fileName: String) -> Image {
        return fileName.withCString { cString in
            return _RaylibC.LoadImage(cString)
        }
    }
    
    /// Load image from RAW file data
    @_transparent
    static func loadImageRaw(_ fileName: String, _ width: Int32, _ height: Int32, _ format: PixelFormat, _ headerSize: Int32) -> Image {
        return fileName.withCString { cString in
            return _RaylibC.LoadImageRaw(cString, width, height, format.rawValue, headerSize)
        }
    }
    
    /// Load image sequence from file (frames appended to image.data)
    @_transparent
    static func loadImageAnim(_ fileName: String, _ frames: inout Int32) -> Image {
        return fileName.withCString { cString in
            return _RaylibC.LoadImageAnim(cString, &frames)
        }
    }
    
    /// Load image from memory buffer, fileType refers to extension: i.e. ".png"
    @_transparent
    static func loadImageFromMemory(_ fileType: String, _ fileData: UnsafePointer<UInt8>!, _ dataSize: Int32) -> Image {
        return fileType.withCString { cString in
            return _RaylibC.LoadImageFromMemory(cString, fileData, dataSize)
        }
    }
    
    /// Unload image from CPU memory (RAM)
    @_transparent
    static func unloadImage(_ image: Image) {
        _RaylibC.UnloadImage(image)
    }
    
    /// Export image data to file, returns true on success
    @_transparent
    static func exportImage(_ image: Image, _ fileName: String) -> Bool {
        return fileName.withCString { cString in
            let result = _RaylibC.ExportImage(image, cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Export image as code file defining an array of bytes, returns true on success
    @_transparent
    static func exportImageAsCode(_ image: Image, _ fileName: String) -> Bool {
        return fileName.withCString { cString in
            let result = _RaylibC.ExportImageAsCode(image, cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    //MARK: - Image generation functions
    
    /// Generate image: plain color
    @_transparent
    static func genImageColor(_ width: Int32, _ height: Int32, _ color: Color) -> Image {
        return _RaylibC.GenImageColor(width, height, color)
    }
    
    /// Generate image: vertical gradient
    @_transparent
    static func genImageGradientV(_ width: Int32, _ height: Int32, _ top: Color, _ bottom: Color) -> Image {
        return _RaylibC.GenImageGradientV(width, height, top, bottom)
    }
    
    /// Generate image: horizontal gradient
    @_transparent
    static func genImageGradientH(_ width: Int32, _ height: Int32, _ left: Color, _ right: Color) -> Image {
        return _RaylibC.GenImageGradientH(width, height, left, right)
    }
    
    /// Generate image: radial gradient
    @_transparent
    static func genImageGradientRadial(_ width: Int32, _ height: Int32, _ density: Float, _ inner: Color, _ outer: Color) -> Image {
        return _RaylibC.GenImageGradientRadial(width, height, density, inner, outer)
    }
    
    /// Generate image: checked
    @_transparent
    static func genImageChecked(_ width: Int32, _ height: Int32, _ checksX: Int32, _ checksY: Int32, _ col1: Color, _ col2: Color) -> Image {
        return _RaylibC.GenImageChecked(width, height, checksX, checksY, col1, col2)
    }
    
    /// Generate image: white noise
    @_transparent
    static func genImageWhiteNoise(_ width: Int32, _ height: Int32, _ factor: Float) -> Image {
        return _RaylibC.GenImageWhiteNoise(width, height, factor)
    }
    
    /// Generate image: perlin noise
    @_transparent
    static func genImagePerlinNoise(_ width: Int32, _ height: Int32, _ offsetX: Int32, _ offsetY: Int32, _ scale: Float) -> Image {
        return _RaylibC.GenImagePerlinNoise(width, height, offsetX, offsetY, scale)
    }
    
    /// Generate image: cellular algorithm. Bigger tileSize means bigger cells
    @_transparent
    static func genImageCellular(_ width: Int32, _ height: Int32, _ tileSize: Int32) -> Image {
        return _RaylibC.GenImageCellular(width, height, tileSize)
    }
    
    //MARK: - Image manipulation functions
    
    /// Create an image duplicate (useful for transformations)
    @_transparent
    static func imageCopy(_ image: Image) -> Image {
        return _RaylibC.ImageCopy(image)
    }
    
    /// Create an image from another image piece
    @_transparent
    static func imageFromImage(_ image: Image, _ rec: Rectangle) -> Image {
        return _RaylibC.ImageFromImage(image, rec)
    }
    
    /// Create an image from text (default font)
    @_transparent
    static func imageText(_ text: String, _ fontSize: Int32, _ color: Color) -> Image {
        return text.withCString { cString in
            return _RaylibC.ImageText(cString, fontSize, color)
        }
    }
    
    /// Create an image from text (custom sprite font)
    @_transparent
    static func imageTextEx(_ font: Font, _ text: String, _ fontSize: Float, _ spacing: Float, _ tint: Color) -> Image {
        return text.withCString { cString in
            return _RaylibC.ImageTextEx(font, cString, fontSize, spacing, tint)
        }
    }
    
    /// Convert image data to desired format
    @_transparent
    static func imageFormat(_ image: inout Image, _ newFormat: PixelFormat) {
        _RaylibC.ImageFormat(&image, newFormat.rawValue)
    }
    
    /// Convert image to POT (power-of-two)
    @_transparent
    static func imageToPOT(_ image: inout Image, _ fill: Color) {
        _RaylibC.ImageToPOT(&image, fill)
    }
    
    /// Crop an image to a defined rectangle
    @_transparent
    static func imageCrop(_ image: inout Image, _ crop: Rectangle) {
        _RaylibC.ImageCrop(&image, crop)
    }
    
    /// Crop image depending on alpha value
    @_transparent
    static func imageAlphaCrop(_ image: inout Image, _ threshold: Float) {
        _RaylibC.ImageAlphaCrop(&image, threshold)
    }
    
    /// Clear alpha channel to desired color
    @_transparent
    static func imageAlphaClear(_ image: inout Image, _ color: Color, _ threshold: Float) {
        _RaylibC.ImageAlphaClear(&image, color, threshold)
    }
    
    /// Apply alpha mask to image
    @_transparent
    static func imageAlphaMask(_ image: inout Image, _ alphaMask: Image) {
        _RaylibC.ImageAlphaMask(&image, alphaMask)
    }
    
    /// Premultiply alpha channel
    @_transparent
    static func imageAlphaPremultiply(_ image: inout Image) {
        _RaylibC.ImageAlphaPremultiply(&image)
    }
    
    /// Resize image (Bicubic scaling algorithm)
    @_transparent
    static func imageResize(_ image: inout Image, _ newWidth: Int32, _ newHeight: Int32) {
        _RaylibC.ImageResize(&image, newWidth, newHeight)
    }
    
    /// Resize image (Nearest-Neighbor scaling algorithm)
    @_transparent
    static func imageResizeNN(_ image: inout Image, _ newWidth: Int32, _ newHeight: Int32) {
        _RaylibC.ImageResizeNN(&image, newWidth, newHeight)
    }
    
    /// Resize canvas and fill with color
    @_transparent
    static func imageResizeCanvas(_ image: inout Image, _ newWidth: Int32, _ newHeight: Int32, _ offsetX: Int32, _ offsetY: Int32, _ fill: Color) {
        _RaylibC.ImageResizeCanvas(&image, newWidth, newHeight, offsetX, offsetY, fill)
    }
    
    /// Generate all mipmap levels for a provided image
    @_transparent
    static func imageMipmaps(_ image: inout Image) {
        _RaylibC.ImageMipmaps(&image)
    }
    
    /// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
    @_transparent
    static func imageDither(_ image: inout Image, _ rBpp: Int32, _ gBpp: Int32, _ bBpp: Int32, _ aBpp: Int32) {
        _RaylibC.ImageDither(&image, rBpp, gBpp, bBpp, aBpp)
    }
    
    /// Flip image vertically
    @_transparent
    static func imageFlipVertical(_ image: inout Image) {
        _RaylibC.ImageFlipVertical(&image)
    }
    
    /// Flip image horizontally
    @_transparent
    static func imageFlipHorizontal(_ image: inout Image) {
        _RaylibC.ImageFlipHorizontal(&image)
    }
    
    /// Rotate image clockwise 90deg
    @_transparent
    static func imageRotateCW(_ image: inout Image) {
        _RaylibC.ImageRotateCW(&image)
    }
    
    /// Rotate image counter-clockwise 90deg
    @_transparent
    static func imageRotateCCW(_ image: inout Image) {
        _RaylibC.ImageRotateCCW(&image)
    }
    
    /// Modify image color: tint
    @_transparent
    static func imageColorTint(_ image: inout Image, _ color: Color) {
        _RaylibC.ImageColorTint(&image, color)
    }
    
    /// Modify image color: invert
    @_transparent
    static func imageColorInvert(_ image: inout Image) {
        _RaylibC.ImageColorInvert(&image)
    }
    
    /// Modify image color: grayscale
    @_transparent
    static func imageColorGrayscale(_ image: inout Image) {
        _RaylibC.ImageColorGrayscale(&image)
    }
    
    /// Modify image color: contrast (-100 to 100)
    @_transparent
    static func imageColorContrast(_ image: inout Image, _ contrast: Float) {
        _RaylibC.ImageColorContrast(&image, contrast)
    }
    
    /// Modify image color: brightness (-255 to 255)
    @_transparent
    static func imageColorBrightness(_ image: inout Image, _ brightness: Int32) {
        _RaylibC.ImageColorBrightness(&image, brightness)
    }
    
    /// Modify image color: replace color
    @_transparent
    static func imageColorReplace(_ image: inout Image, _ color: Color, _ replace: Color) {
        _RaylibC.ImageColorReplace(&image, color, replace)
    }
    
    /// Load color data from image as a Color array (RGBA - 32bit)
    @_transparent
    static func loadImageColors(_ image: Image) -> [Color] {
        let count = image.width * image.height * 4
        let result = _RaylibC.LoadImageColors(image)
        let buffer = UnsafeMutableBufferPointer(start: result, count: Int(count))
        return Array(buffer)
    }
    
    /// Load colors palette from image as a Color array (RGBA - 32bit)
    @_transparent
    static func loadImagePalette(_ image: Image, _ maxPaletteSize: Int32) -> [Color] {
        var colorsCount: Int32 = 0
        let result = _RaylibC.LoadImagePalette(image, maxPaletteSize, &colorsCount)
        let buffer = UnsafeMutableBufferPointer(start: result, count: Int(colorsCount))
        return Array(buffer)
    }
    
    /// Unload color data loaded with LoadImageColors()
    @_transparent @available(*, unavailable, message: "No need to do this in swift.")
    static func unloadImageColors(_ colors: [Color]) {
        var _colors = colors
        _RaylibC.UnloadImageColors(&_colors)
    }
    
    /// Unload colors palette loaded with LoadImagePalette()
    @_transparent @available(*, unavailable, message: "No need to do this in swift.")
    static func unloadImagePalette(_ colors: [Color]) {
        var _colors = colors
        _RaylibC.UnloadImagePalette(&_colors)
    }
    
    /// Get image alpha border rectangle
    @_transparent
    static func getImageAlphaBorder(_ image: Image, _ threshold: Float) -> Rectangle {
        return _RaylibC.GetImageAlphaBorder(image, threshold)
    }
    
    //MARK: - Image drawing functions
    // NOTE: Image software-rendering functions (CPU)
    
    /// Clear image background with given color
    @_transparent
    static func imageClearBackground(_ dst: inout Image, _ color: Color) {
        _RaylibC.ImageClearBackground(&dst, color)
    }
    
    /// Draw pixel within an image
    @_transparent
    static func imageDrawPixel(_ dst: inout Image, _ posX: Int32, _ posY: Int32, _ color: Color) {
        _RaylibC.ImageDrawPixel(&dst, posX, posY, color)
    }
    
    /// Draw pixel within an image (Vector version)
    @_transparent
    static func imageDrawPixelV(_ dst: inout Image, _ position: Vector2, _ color: Color) {
        _RaylibC.ImageDrawPixelV(&dst, position, color)
    }
    
    /// Draw line within an image
    @_transparent
    static func imageDrawLine(_ dst: inout Image, _ startPosX: Int32, _ startPosY: Int32, _ endPosX: Int32, _ endPosY: Int32, _ color: Color) {
        _RaylibC.ImageDrawLine(&dst, startPosX, startPosY, endPosX, endPosY, color)
    }
    
    /// Draw line within an image (Vector version)
    @_transparent
    static func imageDrawLineV(_ dst: inout Image, _ start: Vector2, _ end: Vector2, _ color: Color) {
        _RaylibC.ImageDrawLineV(&dst, start, end, color)
    }
    
    /// Draw circle within an image
    @_transparent
    static func imageDrawCircle(_ dst: inout Image, _ centerX: Int32, _ centerY: Int32, _ radius: Int32, _ color: Color) {
        _RaylibC.ImageDrawCircle(&dst, centerX, centerY, radius, color)
    }
    
    /// Draw circle within an image (Vector version)
    @_transparent
    static func imageDrawCircleV(_ dst: inout Image, _ center: Vector2, _ radius: Int32, _ color: Color) {
        _RaylibC.ImageDrawCircleV(&dst, center, radius, color)
    }
    
    /// Draw rectangle within an image
    @_transparent
    static func imageDrawRectangle(_ dst: inout Image, _ posX: Int32, _ posY: Int32, _ width: Int32, _ height: Int32, _ color: Color) {
        _RaylibC.ImageDrawRectangle(&dst, posX, posY, width, height, color)
    }
    
    /// Draw rectangle within an image (Vector version)
    @_transparent
    static func imageDrawRectangleV(_ dst: inout Image, _ position: Vector2, _ size: Vector2, _ color: Color) {
        _RaylibC.ImageDrawRectangleV(&dst, position, size, color)
    }
    
    /// Draw rectangle within an image
    @_transparent
    static func imageDrawRectangleRec(_ dst: inout Image, _ rec: Rectangle, _ color: Color) {
        _RaylibC.ImageDrawRectangleRec(&dst, rec, color)
    }
    
    /// Draw rectangle lines within an image
    @_transparent
    static func imageDrawRectangleLines(_ dst: inout Image, _ rec: Rectangle, _ thick: Int32, _ color: Color) {
        _RaylibC.ImageDrawRectangleLines(&dst, rec, thick, color)
    }
    
    /// Draw a source image within a destination image (tint applied to source)
    @_transparent
    static func imageDraw(_ dst: inout Image, _ src: Image, _ srcRec: Rectangle, _ dstRec: Rectangle, _ tint: Color) {
        _RaylibC.ImageDraw(&dst, src, srcRec, dstRec, tint)
    }
    
    /// Draw text (using default font) within an image (destination)
    @_transparent
    static func imageDrawText(_ dst: inout Image, _ text: String, _ posX: Int32, _ posY: Int32, _ fontSize: Int32, _ color: Color) {
        text.withCString { cString in
            _RaylibC.ImageDrawText(&dst, cString, posX, posY, fontSize, color)
        }
    }
    
    /// Draw text (custom sprite font) within an image (destination)
    @_transparent
    static func imageDrawTextEx(_ dst: inout Image, _ font: Font, _ text: String, _ position: Vector2, _ fontSize: Float, _ spacing: Float, _ tint: Color) {
        text.withCString { cString in
            _RaylibC.ImageDrawTextEx(&dst, font, cString, position, fontSize, spacing, tint)
        }
    }
    
    //MARK: - Texture loading functions
    // NOTE: These functions require GPU access
    
    /// Load texture from file into GPU memory (VRAM)
    @_transparent
    static func loadTexture(_ fileName: String) -> Texture2D {
        return fileName.withCString { cString in
            return _RaylibC.LoadTexture(cString)
        }
    }
    
    /// Load texture from image data
    @_transparent
    static func loadTextureFromImage(_ image: Image) -> Texture2D {
        return _RaylibC.LoadTextureFromImage(image)
    }
    
    /// Load cubemap from image, multiple image cubemap layouts supported
    @_transparent
    static func loadTextureCubemap(_ image: Image, _ layout: CubemapLayout) -> TextureCubemap {
        return _RaylibC.LoadTextureCubemap(image, layout.rawValue)
    }
    
    /// Load texture for rendering (framebuffer)
    @_transparent
    static func loadRenderTexture(_ width: Int32, _ height: Int32) -> RenderTexture2D {
        return _RaylibC.LoadRenderTexture(width, height)
    }
    
    /// Unload texture from GPU memory (VRAM)
    @_transparent
    static func unloadTexture(_ texture: Texture2D) {
        return _RaylibC.UnloadTexture(texture)
    }
    
    /// Unload render texture from GPU memory (VRAM)
    @_transparent
    static func unloadRenderTexture(_ target: RenderTexture2D) {
        return _RaylibC.UnloadRenderTexture(target)
    }
    
    /// Update GPU texture with new data
    @_transparent
    static func updateTexture(_ texture: Texture2D, _ pixels: UnsafeRawPointer!) {
        _RaylibC.UpdateTexture(texture, pixels)
    }
    
    /// Update GPU texture rectangle with new data
    @_transparent
    static func updateTextureRec(_ texture: Texture2D, _ rec: Rectangle, _ pixels: UnsafeRawPointer!) {
        _RaylibC.UpdateTextureRec(texture, rec, pixels)
    }
    
    /// Get pixel data from GPU texture and return an Image
    @_transparent
    static func getTextureData(_ texture: Texture2D) -> Image {
        return _RaylibC.GetTextureData(texture)
    }
    
    /// Get pixel data from screen buffer and return an Image (screenshot)
    @_transparent
    static func getScreenData() -> Image {
        return _RaylibC.GetScreenData()
    }
    
    //MARK: - Texture configuration functions
    
    /// Generate GPU mipmaps for a texture
    @_transparent
    static func genTextureMipmaps(_ texture: inout Texture2D) {
        _RaylibC.GenTextureMipmaps(&texture)
    }
    
    /// Set texture scaling filter mode
    @_transparent
    static func setTextureFilter(_ texture: Texture2D, _ filter: TextureFilter) {
        _RaylibC.SetTextureFilter(texture, filter.rawValue)
    }
    
    /// Set texture wrapping mode
    @_transparent
    static func setTextureWrap(_ texture: Texture2D, _ wrap: TextureWrap) {
        _RaylibC.SetTextureWrap(texture, wrap.rawValue)
    }
    
    //MARK: - Texture drawing functions
    
    /// Draw a Texture2D
    @_transparent
    static func drawTexture(_ texture: Texture2D, _ posX: Int32, _ posY: Int32, _ tint: Color) {
        return _RaylibC.DrawTexture(texture, posX, posY, tint)
    }
    
    /// Draw a Texture2D with position defined as Vector2
    @_transparent
    static func drawTextureV(_ texture: Texture2D, _ position: Vector2, _ tint: Color) {
        _RaylibC.DrawTextureV(texture, position, tint)
    }
    
    //// Draw a Texture2D with extended parameters
    @_transparent
    static func drawTextureEx(_ texture: Texture2D, _ position: Vector2, _ rotation: Float, _ scale: Float, _ tint: Color) {
        _RaylibC.DrawTextureEx(texture, position, rotation, scale, tint)
    }
    
    /// Draw a part of a texture defined by a rectangle
    @_transparent
    static func drawTextureRec(_ texture: Texture2D, _ source: Rectangle, _ position: Vector2, _ tint: Color) {
        _RaylibC.DrawTextureRec(texture, source, position, tint)
    }
    
    /// Draw texture quad with tiling and offset parameters
    @_transparent
    static func drawTextureQuad(_ texture: Texture2D, _ tiling: Vector2, _ offset: Vector2, _ quad: Rectangle, _ tint: Color) {
        _RaylibC.DrawTextureQuad(texture, tiling, offset, quad, tint)
    }
    
    /// Draw part of a texture (defined by a rectangle) with rotation and scale tiled into dest.
    @_transparent
    static func drawTextureTiled(_ texture: Texture2D, _ source: Rectangle, _ dest: Rectangle, _ origin: Vector2, _ rotation: Float, _ scale: Float, _ tint: Color) {
        _RaylibC.DrawTextureTiled(texture, source, dest, origin, rotation, scale, tint)
    }
    
    /// Draw a part of a texture defined by a rectangle with 'pro' parameters
    @_transparent
    static func drawTexturePro(_ texture: Texture2D, _ source: Rectangle, _ dest: Rectangle, _ origin: Vector2, _ rotation: Float, _ tint: Color) {
        _RaylibC.DrawTexturePro(texture, source, dest, origin, rotation, tint)
    }
    
    /// Draws a texture (or part of it) that stretches or shrinks nicely
    @_transparent
    static func drawTextureNPatch(_ texture: Texture2D, _ nPatchInfo: NPatchInfo, _ dest: Rectangle, _ origin: Vector2, _ rotation: Float, _ tint: Color) {
        _RaylibC.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint)
    }
    
    /// Draw a textured polygon
    @_transparent
    static func drawTexturePoly(_ texture: Texture2D, _ center: Vector2, _ points: [Vector2], _ texcoords: [Vector2], _ tint: Color) {
        var _points = points
        var _texcoords = texcoords
        _RaylibC.DrawTexturePoly(texture, center, &_points, &_texcoords, Int32(points.count), tint)
    }
    
    //MARK: - Color/pixel related functions
    
    /// Returns color with alpha applied, alpha goes from 0.0f to 1.0f
    @_transparent
    static func fade(_ color: Color, _ alpha: Float) -> Color {
        return _RaylibC.Fade(color, alpha)
    }
    
    /// Returns hexadecimal value for a Color
    @_transparent
    static func colorToInt(_ color: Color) -> Int32 {
        return _RaylibC.ColorToInt(color)
    }
    
    /// Returns Color normalized as float [0..1]
    @_transparent
    static func colorNormalize(_ color: Color) -> Vector4 {
        return _RaylibC.ColorNormalize(color)
    }
    
    /// Returns Color from normalized values [0..1]
    @_transparent
    static func colorFromNormalized(_ normalized: Vector4) -> Color {
        return _RaylibC.ColorFromNormalized(normalized)
    }
    
    /// Returns HSV values for a Color, hue [0..360], saturation/value [0..1]
    @_transparent
    static func colorToHSV(_ color: Color) -> Vector3 {
        return _RaylibC.ColorToHSV(color)
    }
    
    /// Returns a Color from HSV values, hue [0..360], saturation/value [0..1]
    @_transparent
    static func colorFromHSV(_ hue: Float, _ saturation: Float, _ value: Float) -> Color {
        return _RaylibC.ColorFromHSV(hue, saturation, value)
    }
    
    /// Returns color with alpha applied, alpha goes from 0.0f to 1.0f
    @_transparent
    static func colorAlpha(_ color: Color, _ alpha: Float) -> Color {
        return _RaylibC.ColorAlpha(color, alpha)
    }
    
    /// Returns src alpha-blended into dst color with tint
    @_transparent
    static func colorAlphaBlend(_ dst: Color, _ src: Color, _ tint: Color) -> Color {
        return _RaylibC.ColorAlphaBlend(dst, src, tint)
    }
    
    /// Get Color structure from hexadecimal value
    @_transparent
    static func getColor(_ hexValue: Int32) -> Color {
        return _RaylibC.GetColor(hexValue)
    }
    
    /// Get Color from a source pixel pointer of certain format
    @_transparent
    static func getPixelColor(_ srcPtr: UnsafeMutableRawPointer!, _ format: PixelFormat) -> Color {
        return _RaylibC.GetPixelColor(srcPtr, format.rawValue)
    }
    
    /// Set color formatted into destination pixel pointer
    @_transparent
    static func setPixelColor(_ dstPtr: UnsafeMutableRawPointer!, _ color: Color, _ format: PixelFormat) {
        return _RaylibC.SetPixelColor(dstPtr, color, format.rawValue)
    }
    
    /// Get pixel data size in bytes for certain format
    @_transparent
    static func getPixelDataSize(_ width: Int32, _ height: Int32, _ format: PixelFormat) -> Int32 {
        return _RaylibC.GetPixelDataSize(width, height, format.rawValue)
    }
}
