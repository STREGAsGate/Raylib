/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

// Font type, defines generation method
public enum FontType: Int32 {
    /// Default font generation, anti-aliased
    case `default` = 0
    /// Bitmap font generation, no anti-aliasing
    case bitmap
    /// SDF font generation, requires external shader
    case sdf
}
