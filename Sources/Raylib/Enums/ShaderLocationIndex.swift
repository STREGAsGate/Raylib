/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Shader location index
public enum ShaderLocationIndex: Int32 {
    case vertexPosition = 0
    case vertexTexcoord01
    case vertexTexcoord02
    case vertexNormal
    case vertexTangent
    case vertexColor
    case matrixMVP
    case matrixView
    case matrixProjection
    case matrixModel
    case matrixNormal
    case vectorView
    case colorDiffuse
    case colorSpecular
    case colorAmbient
    case mapAlbedo // SHADER_LOC_MAP_DIFFUSE
    case mapMetalness // SHADER_LOC_MAP_SPECULAR
    case mapNormal
    case mapRoughness
    case mapOcclusion
    case mapEmission
    case mapHeight
    case mapCubemap
    case mapIrradiance
    case mapPrefilter
    case mapBrdf
}
