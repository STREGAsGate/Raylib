/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Raylib {
    //MARK: - VR stereo config functions for VR simulator
    
    /// Load VR stereo config for VR simulator device parameters
    @_transparent
    static func loadVrStereoConfig(_ device: VrDeviceInfo) -> VrStereoConfig {
        _RaylibC.LoadVrStereoConfig(device)
    }
    
    /// Unload VR stereo config
    @_transparent
    static func unloadVrStereoConfig(_ config: VrStereoConfig) {
        _RaylibC.UnloadVrStereoConfig(config)
    }
}
