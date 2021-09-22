/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Color blending modes (pre-defined)
public enum BlendMode: Int32 {
    /// Blend textures considering alpha (default)
    case alpha = 0
    /// Blend textures adding colors
    case additive
    /// Blend textures multiplying colors
    case multiplied
    /// Blend textures adding colors (alternative)
    case addColors
    /// Blend textures subtracting colors (alternative)
    case blendColors
    /// Belnd textures using custom src/dst factors (use rlSetBlendMode())
    case custom
}
