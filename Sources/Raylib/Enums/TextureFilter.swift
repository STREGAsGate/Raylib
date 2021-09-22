/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
public enum TextureFilter: Int32 {
    /// No filter, just pixel aproximation
    case point = 0
    /// Linear filtering
    case bilinear
    /// Trilinear filtering (linear with mipmaps)
    case trilinear
    /// Anisotropic filtering 4x
    case anisotropic4x
    /// Anisotropic filtering 8x
    case anisotropic8X
    /// Anisotropic filtering 16x
    case anisotropic16x
}
