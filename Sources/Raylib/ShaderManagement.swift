/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import _RaylibC

public extension Raylib {
    //MARK: - Shader management functions
    // NOTE: Shader functionality is not available on OpenGL 1.1
    
    
    /// Load shader from files and bind default locations
    @_transparent
    static func loadShader(_ vsFileName: String, _ fsFileName: String) -> Shader {
        return vsFileName.withCString { vsCString in
            return fsFileName.withCString { fsCString in
                return _RaylibC.LoadShader(vsCString, fsCString)
            }
        }
    }
    
    /// Load shader from code strings and bind default locations
    @_transparent
    static func loadShaderFromMemory(_ vsCode: String, _ fsCode: String) -> Shader {
        return vsCode.withCString { vsCString in
            return fsCode.withCString { fsCString in
                return _RaylibC.LoadShaderFromMemory(vsCString, fsCString)
            }
        }
    }
    
    /// Get shader uniform location
    @_transparent
    static func getShaderLocation(_ shader: Shader, _ uniformName: String) -> Int32 {
        return uniformName.withCString { cString in
            return _RaylibC.GetShaderLocation(shader, cString)
        }
    }
    
    /// Get shader attribute location
    @_transparent
    static func getShaderLocationAttrib(_ shader: Shader, _ attribName: String) -> Int32 {
        return attribName.withCString { cString in
            return _RaylibC.GetShaderLocationAttrib(shader, cString)
        }
    }
    
    /// Set shader uniform value
    @_transparent
    static func setShaderValue(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ value: Any, _ uniformType: ShaderUniformDataType) {
        var _value = value
        _RaylibC.SetShaderValue(shader, locIndex.rawValue, &_value, uniformType.rawValue)
    }
    
    /// Set shader uniform value vector
    @_transparent
    static func setShaderValueV(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ value: Any, _ uniformType: ShaderUniformDataType, _ count: Int32) {
        var _value = value
        _RaylibC.SetShaderValueV(shader, locIndex.rawValue, &_value, uniformType.rawValue, count)
    }
    
    /// Set shader uniform value (matrix 4x4)
    @_transparent
    static func setShaderValueMatrix(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ mat: Matrix) {
        _RaylibC.SetShaderValueMatrix(shader, locIndex.rawValue, mat)
    }
    
    /// Set shader uniform value for texture (sampler2d)
    @_transparent
    static func setShaderValueTexture(_ shader: Shader, _ locIndex: ShaderLocationIndex, _ texture: Texture2D) {
        _RaylibC.SetShaderValueTexture(shader, locIndex.rawValue, texture)
    }
    
    /// Unload shader from GPU memory (VRAM)
    @_transparent
    static func unloadShader(_ shader: Shader) {
        _RaylibC.UnloadShader(shader)
    }
}
