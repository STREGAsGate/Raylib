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
        self.init(position: position, target: target, up: up, fovy: fovy, projection: projection.rawValue)
    }
    
    var cameraProjection: CameraProjection {
        get {
            return CameraProjection(rawValue: projection)!
        }
        set {
            projection = newValue.rawValue
        }
    }
}
