/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Raylib {
    //------------------------------------------------------------------------------------
    // Camera System Functions (Module: camera)
    //------------------------------------------------------------------------------------
    
    /// Set camera mode (multiple camera modes available)
    @inlinable
    static func setCameraMode(_ camera: Camera, _ mode: CameraMode) {
        _RaylibC.SetCameraMode(camera, mode.rawValue)
    }
    
    /// Update camera position for selected mode
    @inlinable
    static func updateCamera(_ camera: inout Camera) {
        _RaylibC.UpdateCamera(&camera)
    }
    
    /// Set camera pan key to combine with mouse movement (free camera)
    @inlinable
    static func setCameraPanControl(_ keyPan: Int32) {
        _RaylibC.SetCameraPanControl(keyPan)
    }
    
    /// Set camera alt key to combine with mouse movement (free camera)
    @inlinable
    static func setCameraAltControl(_ keyAlt: Int32) {
        _RaylibC.SetCameraAltControl(keyAlt)
    }
    
    /// Set camera smooth zoom key to combine with mouse (free camera)
    @inlinable
    static func setCameraSmoothZoomControl(_ keySmoothZoom: Int32) {
        _RaylibC.SetCameraSmoothZoomControl(keySmoothZoom)
    }
    
    /// Set camera move controls (1st person and 3rd person cameras)
    @inlinable
    static func setCameraMoveControls(_ keyFront: KeyboardKey, _ keyBack: KeyboardKey, _ keyRight: KeyboardKey, _ keyLeft: KeyboardKey, _ keyUp: KeyboardKey, _ keyDown: KeyboardKey) {
        _RaylibC.SetCameraMoveControls(keyFront.rawValue, keyBack.rawValue, keyRight.rawValue, keyLeft.rawValue, keyUp.rawValue, keyDown.rawValue)
    }
}
