/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
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
