/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Image {
    @_transparent
    init(data: UnsafeMutableRawPointer!, width: Int32, height: Int32, mipmaps: Int32, format: PixelFormat) {
        self.init(data: data, width: width, height: height, mipmaps: mipmaps, format: format.rawValue)
    }
    
    @_transparent
    var pixelFormat: PixelFormat {
        get {
            return PixelFormat(rawValue: format)!
        }
        set {
            format = newValue.rawValue
        }
    }
}

#if canImport(Foundation)
import Foundation

public extension Image {
    @_transparent
    init(url: URL) {
        self = Raylib.loadImage(url.path)
    }
    
    @available(*, deprecated, renamed: "init(url:)")
    init(_ url: URL) {
        self.init(url: url)
    }
}
#endif

public extension Image {
    @_transparent
    init(fileName: String) {
        self = Raylib.loadImage(fileName)
    }
    
    /// Load image from RAW file data
    @_transparent
    init(fileName: String, width: Int32, height: Int32, format: PixelFormat, headerSize: Int32) {
        self = Raylib.loadImageRaw(fileName, width, height, format, headerSize)
    }
    
    /// Load image sequence from file (frames appended to image.data)
    @_transparent
    init(fileName: String, frames: inout Int32) {
        self = Raylib.loadImageAnim(fileName, &frames)
    }
    
    /// Load image from memory buffer, fileType refers to extension: i.e. ".png"
    @_transparent
    init(fileType: String, fileData: UnsafePointer<UInt8>!, dataSize: Int32) {
        self = Raylib.loadImageFromMemory(fileType, fileData, dataSize)
    }
}

public extension Image {
    /// Unload image from CPU memory (RAM)
    @_transparent
    func unload() {
        Raylib.unloadImage(self)
    }
}

public extension Image {
    /// Export image data to file, returns true on success
    @_transparent
    func export(to fileName: String) -> Bool {
        return Raylib.exportImage(self, fileName)
    }
    
    /// Export image as code file defining an array of bytes, returns true on success
    @_transparent
    func exportAsCode(to fileName: String) -> Bool {
        return Raylib.exportImageAsCode(self, fileName)
    }
}

//MARK: - Image generation functions
public extension Image {
    /// Generate image: plain color
    @_transparent
    init(color: Color, width: Int32, height: Int32) {
        self = Raylib.genImageColor(width, height, color)
    }
    
    /// Generate image: vertical gradient
    @_transparent
    init(gradientTop: Color, gradientBottom: Color, width: Int32, height: Int32) {
        self = Raylib.genImageGradientV(width, height, gradientTop, gradientBottom)
    }
    
    /// Generate image: horizontal gradient
    @_transparent
    init(gradientLeft: Color, gradientRight: Color, width: Int32, height: Int32) {
        self = Raylib.genImageGradientH(width, height, gradientLeft, gradientRight)
    }
    
    /// Generate image: radial gradient
    @_transparent
    init(gradientInner: Color, gradientOuter: Color, density: Float, width: Int32, height: Int32) {
        self = Raylib.genImageGradientRadial(width, height, density, gradientInner, gradientOuter)
    }
    
    /// Generate image: checked
    @_transparent
    init(checkerdXCount: Int32, checkerYCount: Int32, color1: Color, color2: Color, width: Int32, height: Int32) {
        self = Raylib.genImageChecked(width, height, checkerdXCount, checkerYCount, color1, color2)
    }
}

public extension Image {
    /// Generate image: white noise
    @_transparent
    init(whiteNoiseFactor factor: Float, width: Int32, height: Int32) {
        self = Raylib.genImageWhiteNoise(width, height, factor)
    }
    
    
    /// Generate image: cellular algorithm. Bigger tileSize means bigger cells
    @_transparent
    init(cellularWithTileSize tileSize: Int32, width: Int32, height: Int32) {
        self = Raylib.genImageCellular(width, height, tileSize)
    }
}
//
////MARK: - Image manipulation functions
//
///// Create an image duplicate (useful for transformations)
//@_transparent
//static func imageCopy(_ image: Image) -> Image {
//    return _RaylibC.ImageCopy(image)
//}
//
///// Create an image from another image piece
//@_transparent
//static func imageFromImage(_ image: Image, _ rec: Rectangle) -> Image {
//    return _RaylibC.ImageFromImage(image, rec)
//}
//
///// Create an image from text (default font)
//@_transparent
//static func imageText(_ text: String, _ fontSize: Int32, _ color: Color) -> Image {
//    return text.withCString { cString in
//        return _RaylibC.ImageText(cString, fontSize, color)
//    }
//}
//
///// Create an image from text (custom sprite font)
//@_transparent
//static func imageTextEx(_ font: Font, _ text: String, _ fontSize: Float, _ spacing: Float, _ tint: Color) -> Image {
//    return text.withCString { cString in
//        return _RaylibC.ImageTextEx(font, cString, fontSize, spacing, tint)
//    }
//}
//
///// Convert image data to desired format
//@_transparent
//static func imageFormat(_ image: inout Image, _ newFormat: PixelFormat) {
//    _RaylibC.ImageFormat(&image, newFormat.rawValue)
//}
//
///// Convert image to POT (power-of-two)
//@_transparent
//static func imageToPOT(_ image: inout Image, _ fill: Color) {
//    _RaylibC.ImageToPOT(&image, fill)
//}
//
///// Crop an image to a defined rectangle
//@_transparent
//static func imageCrop(_ image: inout Image, _ crop: Rectangle) {
//    _RaylibC.ImageCrop(&image, crop)
//}
//
///// Crop image depending on alpha value
//@_transparent
//static func imageAlphaCrop(_ image: inout Image, _ threshold: Float) {
//    _RaylibC.ImageAlphaCrop(&image, threshold)
//}
//
///// Clear alpha channel to desired color
//@_transparent
//static func imageAlphaClear(_ image: inout Image, _ color: Color, _ threshold: Float) {
//    _RaylibC.ImageAlphaClear(&image, color, threshold)
//}
//
///// Apply alpha mask to image
//@_transparent
//static func imageAlphaMask(_ image: inout Image, _ alphaMask: Image) {
//    _RaylibC.ImageAlphaMask(&image, alphaMask)
//}
//
///// Premultiply alpha channel
//@_transparent
//static func imageAlphaPremultiply(_ image: inout Image) {
//    _RaylibC.ImageAlphaPremultiply(&image)
//}
//
///// Resize image (Bicubic scaling algorithm)
//@_transparent
//static func imageResize(_ image: inout Image, _ newWidth: Int32, _ newHeight: Int32) {
//    _RaylibC.ImageResize(&image, newWidth, newHeight)
//}
//
///// Resize image (Nearest-Neighbor scaling algorithm)
//@_transparent
//static func imageResizeNN(_ image: inout Image, _ newWidth: Int32, _ newHeight: Int32) {
//    _RaylibC.ImageResizeNN(&image, newWidth, newHeight)
//}
//
///// Resize canvas and fill with color
//@_transparent
//static func imageResizeCanvas(_ image: inout Image, _ newWidth: Int32, _ newHeight: Int32, _ offsetX: Int32, _ offsetY: Int32, _ fill: Color) {
//    _RaylibC.ImageResizeCanvas(&image, newWidth, newHeight, offsetX, offsetY, fill)
//}
//
///// Generate all mipmap levels for a provided image
//@_transparent
//static func imageMipmaps(_ image: inout Image) {
//    _RaylibC.ImageMipmaps(&image)
//}
//
///// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
//@_transparent
//static func imageDither(_ image: inout Image, _ rBpp: Int32, _ gBpp: Int32, _ bBpp: Int32, _ aBpp: Int32) {
//    _RaylibC.ImageDither(&image, rBpp, gBpp, bBpp, aBpp)
//}
//
///// Flip image vertically
//@_transparent
//static func imageFlipVertical(_ image: inout Image) {
//    _RaylibC.ImageFlipVertical(&image)
//}
//
///// Flip image horizontally
//@_transparent
//static func imageFlipHorizontal(_ image: inout Image) {
//    _RaylibC.ImageFlipHorizontal(&image)
//}
//
///// Rotate image clockwise 90deg
//@_transparent
//static func imageRotateCW(_ image: inout Image) {
//    _RaylibC.ImageRotateCW(&image)
//}
//
///// Rotate image counter-clockwise 90deg
//@_transparent
//static func imageRotateCCW(_ image: inout Image) {
//    _RaylibC.ImageRotateCCW(&image)
//}
//
///// Modify image color: tint
//@_transparent
//static func imageColorTint(_ image: inout Image, _ color: Color) {
//    _RaylibC.ImageColorTint(&image, color)
//}
//
///// Modify image color: invert
//@_transparent
//static func imageColorInvert(_ image: inout Image) {
//    _RaylibC.ImageColorInvert(&image)
//}
//
///// Modify image color: grayscale
//@_transparent
//static func imageColorGrayscale(_ image: inout Image) {
//    _RaylibC.ImageColorGrayscale(&image)
//}
//
///// Modify image color: contrast (-100 to 100)
//@_transparent
//static func imageColorContrast(_ image: inout Image, _ contrast: Float) {
//    _RaylibC.ImageColorContrast(&image, contrast)
//}
//
///// Modify image color: brightness (-255 to 255)
//@_transparent
//static func imageColorBrightness(_ image: inout Image, _ brightness: Int32) {
//    _RaylibC.ImageColorBrightness(&image, brightness)
//}
//
///// Modify image color: replace color
//@_transparent
//static func imageColorReplace(_ image: inout Image, _ color: Color, _ replace: Color) {
//    _RaylibC.ImageColorReplace(&image, color, replace)
//}
//
///// Load color data from image as a Color array (RGBA - 32bit)
//@_transparent
//static func loadImageColors(_ image: Image) -> [Color] {
//    let count = image.width * image.height * 4
//    let result = _RaylibC.LoadImageColors(image)
//    let buffer = UnsafeMutableBufferPointer(start: result, count: Int(count))
//    return Array(buffer)
//}
//
///// Load colors palette from image as a Color array (RGBA - 32bit)
//@_transparent
//static func loadImagePalette(_ image: Image, _ maxPaletteSize: Int32) -> [Color] {
//    var colorsCount: Int32 = 0
//    let result = _RaylibC.LoadImagePalette(image, maxPaletteSize, &colorsCount)
//    let buffer = UnsafeMutableBufferPointer(start: result, count: Int(colorsCount))
//    return Array(buffer)
//}
//
///// Unload color data loaded with LoadImageColors()
//@_transparent @available(*, unavailable, message: "No need to do this in swift.")
//static func unloadImageColors(_ colors: [Color]) {
//    var _colors = colors
//    _RaylibC.UnloadImageColors(&_colors)
//}
//
///// Unload colors palette loaded with LoadImagePalette()
//@_transparent @available(*, unavailable, message: "No need to do this in swift.")
//static func unloadImagePalette(_ colors: [Color]) {
//    var _colors = colors
//    _RaylibC.UnloadImagePalette(&_colors)
//}
//
///// Get image alpha border rectangle
//@_transparent
//static func getImageAlphaBorder(_ image: Image, _ threshold: Float) -> Rectangle {
//    return _RaylibC.GetImageAlphaBorder(image, threshold)
//}
//
////MARK: - Image drawing functions
//// NOTE: Image software-rendering functions (CPU)
//
///// Clear image background with given color
//@_transparent
//static func imageClearBackground(_ dst: inout Image, _ color: Color) {
//    _RaylibC.ImageClearBackground(&dst, color)
//}
//
///// Draw pixel within an image
//@_transparent
//static func imageDrawPixel(_ dst: inout Image, _ posX: Int32, _ posY: Int32, _ color: Color) {
//    _RaylibC.ImageDrawPixel(&dst, posX, posY, color)
//}
//
///// Draw pixel within an image (Vector version)
//@_transparent
//static func imageDrawPixelV(_ dst: inout Image, _ position: Vector2, _ color: Color) {
//    _RaylibC.ImageDrawPixelV(&dst, position, color)
//}
//
///// Draw line within an image
//@_transparent
//static func imageDrawLine(_ dst: inout Image, _ startPosX: Int32, _ startPosY: Int32, _ endPosX: Int32, _ endPosY: Int32, _ color: Color) {
//    _RaylibC.ImageDrawLine(&dst, startPosX, startPosY, endPosX, endPosY, color)
//}
//
///// Draw line within an image (Vector version)
//@_transparent
//static func imageDrawLineV(_ dst: inout Image, _ start: Vector2, _ end: Vector2, _ color: Color) {
//    _RaylibC.ImageDrawLineV(&dst, start, end, color)
//}
//
///// Draw circle within an image
//@_transparent
//static func imageDrawCircle(_ dst: inout Image, _ centerX: Int32, _ centerY: Int32, _ radius: Int32, _ color: Color) {
//    _RaylibC.ImageDrawCircle(&dst, centerX, centerY, radius, color)
//}
//
///// Draw circle within an image (Vector version)
//@_transparent
//static func imageDrawCircleV(_ dst: inout Image, _ center: Vector2, _ radius: Int32, _ color: Color) {
//    _RaylibC.ImageDrawCircleV(&dst, center, radius, color)
//}
//
///// Draw rectangle within an image
//@_transparent
//static func imageDrawRectangle(_ dst: inout Image, _ posX: Int32, _ posY: Int32, _ width: Int32, _ height: Int32, _ color: Color) {
//    _RaylibC.ImageDrawRectangle(&dst, posX, posY, width, height, color)
//}
//
///// Draw rectangle within an image (Vector version)
//@_transparent
//static func imageDrawRectangleV(_ dst: inout Image, _ position: Vector2, _ size: Vector2, _ color: Color) {
//    _RaylibC.ImageDrawRectangleV(&dst, position, size, color)
//}
//
///// Draw rectangle within an image
//@_transparent
//static func imageDrawRectangleRec(_ dst: inout Image, _ rec: Rectangle, _ color: Color) {
//    _RaylibC.ImageDrawRectangleRec(&dst, rec, color)
//}
//
///// Draw rectangle lines within an image
//@_transparent
//static func imageDrawRectangleLines(_ dst: inout Image, _ rec: Rectangle, _ thick: Int32, _ color: Color) {
//    _RaylibC.ImageDrawRectangleLines(&dst, rec, thick, color)
//}
//
///// Draw a source image within a destination image (tint applied to source)
//@_transparent
//static func imageDraw(_ dst: inout Image, _ src: Image, _ srcRec: Rectangle, _ dstRec: Rectangle, _ tint: Color) {
//    _RaylibC.ImageDraw(&dst, src, srcRec, dstRec, tint)
//}
//
///// Draw text (using default font) within an image (destination)
//@_transparent
//static func imageDrawText(_ dst: inout Image, _ text: String, _ posX: Int32, _ posY: Int32, _ fontSize: Int32, _ color: Color) {
//    text.withCString { cString in
//        _RaylibC.ImageDrawText(&dst, cString, posX, posY, fontSize, color)
//    }
//}
//
///// Draw text (custom sprite font) within an image (destination)
//@_transparent
//static func imageDrawTextEx(_ dst: inout Image, _ font: Font, _ text: String, _ position: Vector2, _ fontSize: Float, _ spacing: Float, _ tint: Color) {
//    text.withCString { cString in
//        _RaylibC.ImageDrawTextEx(&dst, font, cString, position, fontSize, spacing, tint)
//    }
//}
