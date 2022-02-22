/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Shader location index
public enum ShaderLocationIndex: Int32 {
    /// Shader location: vertex attribute: position
    case vertexPosition
    /// Shader location: vertex attribute: texcoord01
    case vertexTexcoord01
    /// Shader location: vertex attribute: texcoord02
    case vertexTexcoord02
    /// Shader location: vertex attribute: normal
    case vertexNormal
    /// Shader location: vertex attribute: tangent
    case vertexTangent
    /// Shader location: vertex attribute: color
    case vertexColor
    /// Shader location: matrix uniform: model-view-projection
    case matrixMVP
    /// Shader location: matrix uniform: view (camera transform)
    case matrixView
    /// Shader location: matrix uniform: projection
    case matrixProjection
    /// Shader location: matrix uniform: model (transform)
    case matrixModel
    /// Shader location: matrix uniform: normal
    case matrixNormal
    /// Shader location: vector uniform: view
    case vectorView
    /// Shader location: vector uniform: diffuse color
    case colorDiffuse
    /// Shader location: vector uniform: specular color
    case colorSpecular
    /// Shader location: vector uniform: ambient color
    case colorAmbient
    /// Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
    case mapAlbedo
    /// Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
    case mapMetalness
    /// Shader location: sampler2d texture: normal
    case mapNormal
    /// Shader location: sampler2d texture: roughness
    case mapRoughness
    /// Shader location: sampler2d texture: occlusion
    case mapOcclusion
    /// Shader location: sampler2d texture: emission
    case mapEmission
    /// Shader location: sampler2d texture: height
    case mapHeight
    /// Shader location: samplerCube texture: cubemap
    case mapCubemap
    /// Shader location: samplerCube texture: irradiance
    case mapIrradiance
    /// Shader location: samplerCube texture: prefilter
    case mapPrefilter
    /// Shader location: sampler2d texture: brdf
    case mapBrdf
}
