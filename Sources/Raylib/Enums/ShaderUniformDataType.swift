/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Shader uniform data type
public enum ShaderUniformDataType: Int32 {
    /// Shader uniform type: float
    case float
    /// Shader uniform type: vec2 (2 float)
    case vec2
    /// Shader uniform type: vec3 (3 float)
    case vec3
    /// Shader uniform type: vec4 (4 float)
    case vec4
    /// Shader uniform type: int
    case int
    /// Shader uniform type: ivec2 (2 int)
    case iVec2
    /// Shader uniform type: ivec3 (3 int)
    case ivec3
    /// Shader uniform type: ivec4 (4 int)
    case iVec4
    /// Shader uniform type: sampler2d
    case sampler2D
}
