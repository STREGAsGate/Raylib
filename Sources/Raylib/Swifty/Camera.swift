/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Camera {    
    var projection: CameraProjection {
        get {
            return CameraProjection(rawValue: _projection)!
        }
        set {
            _projection = newValue.rawValue
        }
    }
}
