/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Texture {
    /// Load texture from image data
    @_transparent
    init(image: Image) {
        self = Raylib.loadTextureFromImage(image)
    }
}

#if canImport(Foundation)
import Foundation

public extension Texture {
    @_transparent
    init(url: URL) {
        self = Raylib.loadTexture(url.path)
    }
}
#endif
