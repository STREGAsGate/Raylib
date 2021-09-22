/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Camera {
    init(position: Vector3, target: Vector3, up: Vector3, fovy: Float, projection: CameraProjection) {
        self.init(position: position, target: target, up: up, fovy: fovy, __projection: projection.rawValue)
    }
    
    var projection: CameraProjection {
        get {
            return CameraProjection(rawValue: __projection)!
        }
        set {
            __projection = newValue.rawValue
        }
    }
}
