/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Material map index
public enum MaterialMapIndex: Int32 {
    /// Albedo material (same as: MATERIAL_MAP_DIFFUSE)
    case albedo
    /// Metalness material (same as: MATERIAL_MAP_SPECULAR)
    case metalness
    /// Normal material
    case normal
    /// Roughness material
    case roughness
    /// Ambient occlusion material
    case occlusion
    /// Emission material
    case emission
    /// Heightmap material
    case height
    /// Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    case cubemap
    /// Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    case irradiance
    /// Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    case prefilter
    /// Brdf material
    case brdf
}
