/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
public enum PixelFormat: Int32 {
    /// 8 bit per pixel (no alpha)
    case uncompressedGrayscale = 1
    /// 8*2 bpp (2 channels)
    case uncompressedGrayAlpha
    /// 16 bpp
    case uncompressedR5G6B5
    /// 24 bpp
    case uncompressedR8G8B8
    /// 16 bpp (1 bit alpha)
    case uncompressedR5G5B5A1
    /// 16 bpp (4 bit alpha)
    case uncompressedR4G4B4A4
    /// 32 bpp
    case uncompressedR8G8B8A8
    /// 32 bpp (1 channel - float)
    case uncompressedR32
    /// 32*3 bpp (3 channels - float)
    case uncompressedR32G32B32
    /// 32*4 bpp (4 channels - float)
    case uncompressedR32G32B32A32
    /// 4 bpp (no alpha)
    case compressedDxt1RGB
    /// 4 bpp (1 bit alpha)
    case compressedDxt1RGBA
    /// 8 bpp
    case compressedDxt3RGBA
    /// 8 bpp
    case compressedDxt5RGBA
    /// 4 bpp
    case compressedEtc1RGB
    /// 4 bpp
    case compressedEtc2RGB
    /// 8 bpp
    case compressedEtc2EACRGBA
    /// 4 bpp
    case compressedPvrtRGB
    /// 4 bpp
    case compressedPvrtRGBA
    /// 8 bpp
    case compressedAstc4x4RGBA
    /// 2 bpp
    case compressedAstc8x8RGBA
}
