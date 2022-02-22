/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Color blending modes (pre-defined)
public enum BlendMode: Int32 {
    /// Blend textures considering alpha (default)
    case alpha
    /// Blend textures adding colors
    case additive
    /// Blend textures multiplying colors
    case multiplied
    /// Blend textures adding colors (alternative)
    case addColors
    /// Blend textures subtracting colors (alternative)
    case subtractColors
    /// Blend premultiplied textures considering alpha
    case alphaPreMultiplied
    /// Blend textures using custom src/dst factors (use rlSetBlendMode())
    case custom
}
