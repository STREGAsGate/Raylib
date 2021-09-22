/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Cubemap layouts
public enum CubemapLayout: Int32 {
    /// Automatically detect layout type
    case autoDetect = 0
    /// Layout is defined by a vertical line with faces
    case lineVertical
    /// Layout is defined by an horizontal line with faces
    case lineHorizontal
    /// Layout is defined by a 3x4 cross with cubemap faces
    case crossThreeByFour
    /// Layout is defined by a 4x3 cross with cubemap faces
    case crossFourByThree
    /// Layout is defined by a panorama image (equirectangular map)
    case panorama
}
