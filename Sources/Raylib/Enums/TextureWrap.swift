/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

// Texture parameters: wrap mode
public enum TextureWrap: Int32 {
    /// Repeats texture in tiled mode
    case `repeat` = 0
    /// Clamps texture to edge pixel in tiled mode
    case clamp
    /// Mirrors and repeats the texture in tiled mode
    case mirrorRepeat
    /// Mirrors and clamps to border the texture in tiled mode
    case mirrorClamp
}
