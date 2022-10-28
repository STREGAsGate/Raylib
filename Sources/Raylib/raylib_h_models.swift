/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

//------------------------------------------------------------------------------------
// Basic 3d Shapes Drawing Functions (Module: models)
//------------------------------------------------------------------------------------
//MARK: - Basic geometric 3D shapes drawing functions
public extension Raylib {
    /// Draw a line in 3D world space
    @inlinable
    static func drawLine3D(_ startPos: Vector3, _ endPos: Vector3, _ color: Color) {
        _RaylibC.DrawLine3D(startPos, endPos, color)
    }
    
    /// Draw a point in 3D space, actually a small line
    @inlinable
    static func drawPoint3D(_ position: Vector3, _ color: Color) {
        _RaylibC.DrawPoint3D(position, color)
    }
    
    /// Draw a circle in 3D world space
    @inlinable
    static func drawCircle3D(_ center: Vector3, _ radius: Float, _ rotationAxis: Vector3, _ rotationAngle: Float, _ color: Color) {
        _RaylibC.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color)
    }
    
    /// Draw a color-filled triangle (vertex in counter-clockwise order!)
    @inlinable
    static func drawTriangle3D(_ v1: Vector3, _ v2: Vector3, _ v3: Vector3, _ color: Color) {
        _RaylibC.DrawTriangle3D(v1, v2, v3, color)
    }
    
    /// Draw a triangle strip defined by points
    @inlinable
    static func drawTriangleStrip3D(_ points: [Vector3], _ color: Color) {
        var _points = points
        _points.withUnsafeMutableBufferPointer { bufferPointer in
            _RaylibC.DrawTriangleStrip3D(bufferPointer.baseAddress, Int32(points.count), color)
        }
    }
    
    /// Draw cube
    @inlinable
    static func drawCube(_ position: Vector3, _ width: Float, _ height: Float, _ length: Float, _ color: Color) {
        _RaylibC.DrawCube(position, width, height, length, color)
    }
    
    /// Draw cube (Vector version)
    @inlinable
    static func drawCubeV(_ position: Vector3, _ size: Vector3, _ color: Color) {
        _RaylibC.DrawCubeV(position, size, color)
    }
    
    /// Draw cube wires
    @inlinable
    static func drawCubeWires(_ position: Vector3, _ width: Float, _ height: Float, _ length: Float, _ color: Color) {
        _RaylibC.DrawCubeWires(position, width, height, length, color)
    }
    
    /// Draw cube wires (Vector version)
    @inlinable
    static func drawCubeWiresV(_ position: Vector3, _ size: Vector3, _ color: Color) {
        _RaylibC.DrawCubeWiresV(position, size, color)
    }
    
    /// Draw cube textured
    @inlinable
    static func drawCubeTexture(_ texture: Texture2D, _ position: Vector3, _ width: Float, _ height: Float, _ length: Float, _ color: Color) {
        _RaylibC.DrawCubeTexture(texture, position, width, height, length, color)
    }
    
    /// Draw cube with a region of a texture
    @inlinable
    static func drawCubeTextureRec(_ texture: Texture2D, _ source: Rectangle, _ position: Vector3, _ width: Float, _ height: Float, _ length: Float, _ color: Color) {
        _RaylibC.DrawCubeTextureRec(texture, source, position, width, height, length, color)
    }
    
    /// Draw sphere
    @inlinable
    static func drawSphere(_ centerPos: Vector3, _ radius: Float, _ color: Color) {
        _RaylibC.DrawSphere(centerPos, radius, color)
    }
    
    /// Draw sphere with extended parameters
    @inlinable
    static func drawSphereEx(_ centerPos: Vector3, _ radius: Float, _ rings: Int32, _ slices: Int32, _ color: Color) {
        _RaylibC.DrawSphereEx(centerPos, radius, rings, slices, color)
    }
    
    /// Draw sphere wires
    @inlinable
    static func drawSphereWires(_ centerPos: Vector3, _ radius: Float, _ rings: Int32, _ slices: Int32, _ color: Color) {
        _RaylibC.DrawSphereWires(centerPos, radius, rings, slices, color)
    }
    
    /// Draw a cylinder/cone
    @inlinable
    static func drawCylinder(_ position: Vector3, _ radiusTop: Float, _ radiusBottom: Float, _ height: Float, _ slices: Int32, _ color: Color) {
        _RaylibC.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color)
    }
    
    //// Draw a cylinder with base at startPos and top at endPos
    @inlinable
    static func drawCylinderEx(_ startPos: Vector3, _ endPos: Vector3, _ startRadius: Float, _ endRadius: Float, _ sides: Int32, _ color: Color) {
        _RaylibC.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color)
    }
    
    /// Draw a cylinder/cone wires
    @inlinable
    static func drawCylinderWires(_ position: Vector3, _ radiusTop: Float, _ radiusBottom: Float, _ height: Float, _ slices: Int32, _ color: Color) {
        _RaylibC.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color)
    }
    
    //// Draw a cylinder wires with base at startPos and top at endPos
    @inlinable
    static func drawCylinderWiresEx(_ startPos: Vector3, _ endPos: Vector3, _ startRadius: Float, _ endRadius: Float, _ sides: Int32, _ color: Color) {
        _RaylibC.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color)
    }
    
    /// Draw a plane XZ
    @inlinable
    static func drawPlane(_ centerPos: Vector3, _ size: Vector2, _ color: Color) {
        _RaylibC.DrawPlane(centerPos, size, color)
    }
    
    /// Draw a ray line
    @inlinable
    static func drawRay(_ ray: Ray, _ color: Color) {
        _RaylibC.DrawRay(ray, color)
    }
    
    /// Draw a grid (centered at (0, 0, 0))
    @inlinable
    static func drawGrid(_ slices: Int32, _ spacing: Float) {
        _RaylibC.DrawGrid(slices, spacing)
    }
}

//------------------------------------------------------------------------------------
// Model 3d Loading and Drawing Functions (Module: models)
//------------------------------------------------------------------------------------
//MARK: - Model management functions
public extension Raylib {
    /// Load model from files (meshes and materials)
    @inlinable
    static func loadModel(_ fileName: String) -> Model {
        return fileName.withCString { cString in
            return _RaylibC.LoadModel(cString)
        }
    }
    
    /// Load model from generated mesh (default material)
    @inlinable
    static func loadModelFromMesh(_ mesh: Mesh) -> Model {
        return _RaylibC.LoadModelFromMesh(mesh)
    }
    
    /// Unload model (including meshes) from memory (RAM and/or VRAM)
    @inlinable
    static func unloadModel(_ model: Model) {
        _RaylibC.UnloadModel(model)
    }
    
    /// Unload model (but not meshes) from memory (RAM and/or VRAM)
    @inlinable
    static func unloadModelKeepMeshes(_ model: Model) {
        _RaylibC.UnloadModelKeepMeshes(model)
    }
    
    /// Compute model bounding box limits (considers all meshes)
    @inlinable
    static func getModelBoundingBox(_ model: Model) -> BoundingBox {
        return _RaylibC.GetModelBoundingBox(model)
    }
}

//MARK: - Model drawing functions
public extension Raylib {
    /// Draw a model (with texture if set)
    @inlinable
    static func drawModel(_ model: Model , _ position: Vector3, _ scale: Float, _ tint: Color) {
        _RaylibC.DrawModel(model, position, scale, tint)
    }
    
    /// Draw a model with extended parameters
    @inlinable
    static func drawModelEx(_ model: Model, _ position: Vector3, _ rotationAxis: Vector3, _ rotationAngle: Float, _ scale: Vector3, _ tint: Color) {
        _RaylibC.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint)
    }
    
    /// Draw a model wires (with texture if set)
    @inlinable
    static func drawModelWires(_ model: Model, _ position: Vector3, _ scale: Float, _ tint: Color) {
        _RaylibC.DrawModelWires(model, position, scale, tint)
    }
    
    /// Draw a model wires (with texture if set) with extended parameters
    @inlinable
    static func drawModelWiresEx(_ model: Model, _ position: Vector3, _ rotationAxis: Vector3, _ rotationAngle: Float, _ scale: Vector3, _ tint: Color) {
        _RaylibC.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint)
    }
    
    /// Draw bounding box (wires)
    @inlinable
    static func drawBoundingBox(_ box: BoundingBox, _ color: Color) {
        _RaylibC.DrawBoundingBox(box, color)
    }
    
    /// Draw a billboard texture
    @inlinable
    static func drawBillboard(_ camera: Camera, _ texture: Texture2D, _ position: Vector3, _ size: Float, _ tint: Color) {
        _RaylibC.DrawBillboard(camera, texture, position, size, tint)
    }
    
    /// Draw a billboard texture defined by source
    @inlinable
    static func drawBillboardRec(_ camera: Camera, _ texture: Texture2D, _ source: Rectangle, _ position: Vector3, _ size: Vector2, _ tint: Color) {
        _RaylibC.DrawBillboardRec(camera, texture, source, position, size, tint)
    }
    
    /// Draw a billboard texture defined by source and rotation
    @inlinable
    static func drawBillboardPro(_ camera: Camera, _ texture: Texture2D, _ source: Rectangle, _ position: Vector3, _ up: Vector3, _ size: Vector2, _ origin: Vector2, _ rotation: Float, _ tint: Color) {
        _RaylibC.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint)
    }
}

//MARK: - Mesh management functions
public extension Raylib {
    /// Upload mesh vertex data in GPU and provide VAO/VBO ids
    @inlinable
    static func uploadMesh(_ mesh: inout Mesh, _ dynamic: Bool) {
#if os(Windows)
        let dynamic = bool(dynamic ? 1 : 0)
#endif
        _RaylibC.UploadMesh(&mesh, dynamic)
    }
    
    /// Update mesh vertex data in GPU for a specific buffer index
    @inlinable
    static func updateMeshBuffer(_ mesh: Mesh, _ index: Int32, _ data: UnsafeMutableRawPointer!, _ dataSize: Int32, _ offset: Int32) {
        _RaylibC.UpdateMeshBuffer(mesh, index, data, dataSize, offset)
    }
    
    /// Unload mesh data from CPU and GPU
    @inlinable
    static func unloadMesh(_ mesh: Mesh) {
        _RaylibC.UnloadMesh(mesh)
    }
    
    /// Draw a 3d mesh with material and transform
    @inlinable
    static func drawMesh(_ mesh: Mesh, _ material: Material, _ transform: Matrix) {
        _RaylibC.DrawMesh(mesh, material, transform)
    }
    
    /// Draw multiple mesh instances with material and different transforms
    @inlinable
    static func drawMeshInstanced(_ mesh: Mesh, _ material: Material, _ transforms: [Matrix]) {
        var _transforms = transforms
        _RaylibC.DrawMeshInstanced(mesh, material, &_transforms, Int32(_transforms.count))
    }
    
    /// Export mesh data to file, returns true on success
    @inlinable
    static func exportMesh(_ mesh: Mesh, _ fileName: String) -> Bool {
        return fileName.withCString { cStirng in
            let result = _RaylibC.ExportMesh(mesh, cStirng)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Compute mesh bounding box limits
    @inlinable
    static func  getMeshBoundingBox(_ mesh: Mesh) -> BoundingBox {
        _RaylibC.GetMeshBoundingBox(mesh)
    }
    
    /// Compute mesh tangents
    @inlinable
    static func genMeshTangents(_ mesh: inout Mesh) {
        _RaylibC.GenMeshTangents(&mesh)
    }
}

//MARK: - Mesh generation functions
public extension Raylib {
    /// Generate polygonal mesh
    @inlinable
    static func genMeshPoly(_ sides: Int32, _ radius: Float) -> Mesh {
        return _RaylibC.GenMeshPoly(sides, radius)
    }
    
    /// Generate plane mesh (with subdivisions)
    
    @inlinable
    static func genMeshPlane(_ width: Float, _ length: Float, _ resX: Int32, _ resZ: Int32) -> Mesh {
        return _RaylibC.GenMeshPlane(width, length, resX, resZ)
    }
    
    /// Generate cuboid mesh
    @inlinable
    static func genMeshCube(_ width: Float, _ height: Float, _ length: Float) -> Mesh {
        return _RaylibC.GenMeshCube(width, height, length)
    }
    
    /// Generate sphere mesh (standard sphere)
    @inlinable
    static func genMeshSphere(_ radius: Float, _ rings: Int32, _ slices: Int32) -> Mesh {
        return _RaylibC.GenMeshSphere(radius, rings, slices)
    }
    
    /// Generate half-sphere mesh (no bottom cap)
    @inlinable
    static func genMeshHemiSphere(_ radius: Float, _ rings: Int32, _ slices: Int32) -> Mesh {
        return _RaylibC.GenMeshHemiSphere(radius, rings, slices)
    }
    
    /// Generate cylinder mesh
    @inlinable
    static func genMeshCylinder(_ radius: Float, _ height: Float, _ slices: Int32) -> Mesh {
        return _RaylibC.GenMeshCylinder(radius, height, slices)
    }
    
    /// Generate cone/pyramid mesh
    @inlinable
    static func genMeshCone(_ radius: Float, _ height: Float, _ slices: Int32) -> Mesh {
        return _RaylibC.GenMeshCone(radius, height, slices)
    }
    
    /// Generate torus mesh
    @inlinable
    static func genMeshTorus(_ radius: Float, _ size: Float, _ radSeg: Int32, _ sides: Int32) -> Mesh {
        return _RaylibC.GenMeshTorus(radius, size, radSeg, sides)
    }
    
    /// Generate trefoil knot mesh
    @inlinable
    static func genMeshKnot(_ radius: Float, _ size: Float, _ radSeg: Int32, _ sides: Int32) -> Mesh {
        return _RaylibC.GenMeshKnot(radius, size, radSeg, sides)
    }
    
    /// Generate heightmap mesh from image data
    @inlinable
    static func genMeshHeightmap(_ heightmap: Image, _ size: Vector3) -> Mesh {
        return _RaylibC.GenMeshHeightmap(heightmap, size)
    }
    
    /// Generate cubes-based map mesh from image data
    @inlinable
    static func genMeshCubicmap(_ cubicmap: Image, _ cubeSize: Vector3) -> Mesh {
        return _RaylibC.GenMeshCubicmap(cubicmap, cubeSize)
    }
}

//MARK: - Material loading/unloading functions
public extension Raylib {
    /// Load materials from model file
    @inlinable
    static func loadMaterials(_ fileName: String, _ materialCount: UnsafeMutablePointer<Int32>!) -> [Material] {
        return fileName.withCString { cString in
            var materialCount: Int32 = 0
            let result = _RaylibC.LoadMaterials(cString, &materialCount)
            let buffer = UnsafeMutableBufferPointer(start: result, count: Int(materialCount))
            return Array(buffer)
        }
    }
    
    /// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
    @inlinable
    static func loadMaterialDefault() -> Material {
        return _RaylibC.LoadMaterialDefault()
    }
    
    /// Unload material from GPU memory (VRAM)
    @inlinable
    static func unloadMaterial(_ material: Material) {
        _RaylibC.UnloadMaterial(material)
    }
    
    /// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
    @inlinable
    static func setMaterialTexture(_ material: inout Material, _ mapType: MaterialMapIndex, _ texture: Texture2D) {
        _RaylibC.SetMaterialTexture(&material, mapType.rawValue, texture)
    }
    
    /// Set material for a mesh
    @inlinable
    static func setModelMeshMaterial(_ model: inout Model, _ meshId: Int32, _ materialId: Int32) {
        _RaylibC.SetModelMeshMaterial(&model, meshId, materialId)
    }
}

//MARK: - Model animations loading/unloading functions
public extension Raylib {
    /// Load model animations from file
    @inlinable
    static func loadModelAnimations(_ fileName: String) -> [ModelAnimation] {
        return fileName.withCString { cString in
            var animsCount: UInt32 = 0
            let result = _RaylibC.LoadModelAnimations(cString, &animsCount)
            let buffer = UnsafeMutableBufferPointer(start: result, count: Int(animsCount))
            return Array(buffer)
        }
    }
    
    /// Update model animation pose
    @inlinable
    static func updateModelAnimation(_ model: Model, _ anim: ModelAnimation, _ frame: Int32) {
        _RaylibC.UpdateModelAnimation(model, anim, frame)
    }
    
    /// Unload animation data
    @inlinable
    static func unloadModelAnimation(_ anim: ModelAnimation) {
        _RaylibC.UnloadModelAnimation(anim)
    }
    
    /// Unload animation array data
    @inlinable
    static func unloadModelAnimations(_ animations: [ModelAnimation]) {
        var _animations = animations
        _RaylibC.UnloadModelAnimations(&_animations, UInt32(_animations.count))
    }
    
    /// Check model animation skeleton match
    @inlinable
    static func isModelAnimationValid(_ model: Model, _ anim: ModelAnimation) -> Bool {
        let result = _RaylibC.IsModelAnimationValid(model, anim)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
}

//MARK: - Collision detection functions
public extension Raylib {
    /// Check collision between two spheres
    @inlinable
    static func checkCollisionSpheres(_ center1: Vector3, _ radius1: Float, _ center2: Vector3, _ radius2: Float) -> Bool {
        let result = _RaylibC.CheckCollisionSpheres(center1, radius1, center2, radius2)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check collision between two bounding boxes
    @inlinable
    static func checkCollisionBoxes(_ box1: BoundingBox, _ box2: BoundingBox) -> Bool {
        let result = _RaylibC.CheckCollisionBoxes(box1, box2)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Check collision between box and sphere
    @inlinable
    static func checkCollisionBoxSphere(_ box: BoundingBox, _ center: Vector3, _ radius: Float) -> Bool {
        let result = _RaylibC.CheckCollisionBoxSphere(box, center, radius)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get collision info between ray and sphere
    @inlinable
    static func getRayCollisionSphere(_ ray: Ray, _ center: Vector3, _ radius: Float) -> RayCollision {
        return _RaylibC.GetRayCollisionSphere(ray, center, radius)
    }
    
    /// Get collision info between ray and box
    @inlinable
    static func getRayCollisionBox(_ ray: Ray, _ box: BoundingBox) -> RayCollision {
        return _RaylibC.GetRayCollisionBox(ray, box)
    }
    
    /// Get collision info between ray and mesh
    @inlinable
    static func getRayCollisionMesh(_ ray: Ray, _ mesh: Mesh, _ transform: Matrix) -> RayCollision {
        return _RaylibC.GetRayCollisionMesh(ray, mesh, transform)
    }
    
    /// Get collision info between ray and triangle
    @inlinable
    static func getRayCollisionTriangle(_ ray: Ray, _ p1: Vector3, _ p2: Vector3, _ p3: Vector3) -> RayCollision {
        return _RaylibC.GetRayCollisionTriangle(ray, p1, p2, p3)
    }
    
    /// Get collision info between ray and quad
    @inlinable
    static func getRayCollisionQuad(_ ray: Ray, _ p1: Vector3, _ p2: Vector3, _ p3: Vector3, _ p4: Vector3) -> RayCollision {
        return _RaylibC.GetRayCollisionQuad(ray, p1, p2, p3, p4)
    }
}
