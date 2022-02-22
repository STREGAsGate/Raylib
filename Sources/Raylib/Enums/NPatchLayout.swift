/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// N-patch layout
public enum NPatchLayout: Int32 {
    /// Npatch layout: 3x3 tiles
    case ninePatch
    /// Npatch layout: 1x3 tiles
    case threePatchVertical
    /// Npatch layout: 3x1 tiles
    case threePatchHorizontal
}
