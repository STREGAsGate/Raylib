/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Texture parameters: wrap mode
public enum TextureWrap: Int32 {
    /// Repeats texture in tiled mode
    case `repeat`
    /// Clamps texture to edge pixel in tiled mode
    case clamp
    /// Mirrors and repeats the texture in tiled mode
    case mirrorRepeat
    /// Mirrors and clamps to border the texture in tiled mode
    case mirrorClamp
}
