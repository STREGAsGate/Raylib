/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Raylib {
    //------------------------------------------------------------------------------------
    // Model 3d Loading and Drawing Functions (Module: models)
    //------------------------------------------------------------------------------------
    
    //MARK: - Model loading/unloading functions
    
    /// Load model from files (meshes and materials)
    @_transparent
    static func loadModel(_ fileName: String) -> Model {
        return fileName.withCString { cString in
            return _RaylibC.LoadModel(cString)
        }
    }
    
    /// Load model from generated mesh (default material)
    @_transparent
    static func loadModelFromMesh(_ mesh: Mesh) -> Model {
        return _RaylibC.LoadModelFromMesh(mesh)
    }
    
    /// Unload model (including meshes) from memory (RAM and/or VRAM)
    @_transparent
    static func unloadModel(_ model: Model) {
        _RaylibC.UnloadModel(model)
    }
    
    /// Unload model (but not meshes) from memory (RAM and/or VRAM)
    @_transparent
    static func unloadModelKeepMeshes(_ model: Model) {
        _RaylibC.UnloadModelKeepMeshes(model)
    }
    
    //MARK: - Mesh loading/unloading functions
    
    /// Upload mesh vertex data in GPU and provide VAO/VBO ids
    @_transparent
    static func uploadMesh(_ mesh: inout Mesh, _ dynamic: Bool) {
        #if os(Windows)
        let dynamic = bool(dynamic ? 1 : 0)
        #endif
        _RaylibC.UploadMesh(&mesh, dynamic)
    }
    
    /// Update mesh vertex data in GPU for a specific buffer index
    @_transparent
    static func updateMeshBuffer(_ mesh: Mesh, _ index: Int32, _ data: UnsafeMutableRawPointer!, _ dataSize: Int32, _ offset: Int32) {
        _RaylibC.UpdateMeshBuffer(mesh, index, data, dataSize, offset)
    }
    
    /// Draw a 3d mesh with material and transform
    @_transparent
    static func drawMesh(_ mesh: Mesh, _ material: Material, _ transform: Matrix) {
        _RaylibC.DrawMesh(mesh, material, transform)
    }
    
    /// Draw multiple mesh instances with material and different transforms
    @_transparent
    static func drawMeshInstanced(_ mesh: Mesh, _ material: Material, _ transforms: [Matrix]) {
        var _transforms = transforms
        _RaylibC.DrawMeshInstanced(mesh, material, &_transforms, Int32(_transforms.count))
    }
    
    /// Unload mesh data from CPU and GPU
    @_transparent
    static func unloadMesh(_ mesh: Mesh) {
        _RaylibC.UnloadMesh(mesh)
    }
    
    /// Export mesh data to file, returns true on success
    @_transparent
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
    
    //MARK: - Material loading/unloading functions
    
    /// Load materials from model file
    @_transparent
    static func loadMaterials(_ fileName: String, _ materialCount: UnsafeMutablePointer<Int32>!) -> [Material] {
        return fileName.withCString { cString in
            var materialCount: Int32 = 0
            let result = _RaylibC.LoadMaterials(cString, &materialCount)
            let buffer = UnsafeMutableBufferPointer(start: result, count: Int(materialCount))
            return Array(buffer)
        }
    }
    
    /// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
    @_transparent
    static func loadMaterialDefault() -> Material {
        return _RaylibC.LoadMaterialDefault()
    }
    
    /// Unload material from GPU memory (VRAM)
    @_transparent
    static func unloadMaterial(_ material: Material) {
        _RaylibC.UnloadMaterial(material)
    }
    
    /// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
    @_transparent
    static func setMaterialTexture(_ material: inout Material, _ mapType: MaterialMapIndex, _ texture: Texture2D) {
        _RaylibC.SetMaterialTexture(&material, mapType.rawValue, texture)
    }
    
    /// Set material for a mesh
    @_transparent
    static func setModelMeshMaterial(_ model: inout Model, _ meshId: Int32, _ materialId: Int32) {
        _RaylibC.SetModelMeshMaterial(&model, meshId, materialId)
    }
    
    //MARK: - Model animations loading/unloading functions
    
    /// Load model animations from file
    @_transparent
    static func loadModelAnimations(_ fileName: String) -> [ModelAnimation] {
        return fileName.withCString { cString in
            var animsCount: Int32 = 0
            let result = _RaylibC.LoadModelAnimations(cString, &animsCount)
            let buffer = UnsafeMutableBufferPointer(start: result, count: Int(animsCount))
            return Array(buffer)
        }
    }
    
    /// Update model animation pose
    @_transparent
    static func updateModelAnimation(_ model: Model, _ anim: ModelAnimation, _ frame: Int32) {
        _RaylibC.UpdateModelAnimation(model, anim, frame)
    }
    
    /// Unload animation data
    @_transparent
    static func unloadModelAnimation(_ anim: ModelAnimation) {
        _RaylibC.UnloadModelAnimation(anim)
    }
    
    /// Unload animation array data
    @_transparent
    static func unloadModelAnimations(_ animations: [ModelAnimation]) {
        var _animations = animations
        _RaylibC.UnloadModelAnimations(&_animations, UInt32(_animations.count))
    }
    
    /// Check model animation skeleton match
    @_transparent
    static func isModelAnimationValid(_ model: Model, _ anim: ModelAnimation) -> Bool {
        let result = _RaylibC.IsModelAnimationValid(model, anim)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    //MARK: - Mesh generation functions
    
    /// Generate polygonal mesh
    @_transparent
    static func genMeshPoly(_ sides: Int32, _ radius: Float) -> Mesh {
        return _RaylibC.GenMeshPoly(sides, radius)
    }
    
    /// Generate plane mesh (with subdivisions)
    
    @_transparent
    static func genMeshPlane(_ width: Float, _ length: Float, _ resX: Int32, _ resZ: Int32) -> Mesh {
        return _RaylibC.GenMeshPlane(width, length, resX, resZ)
    }
    
    /// Generate cuboid mesh
    @_transparent
    static func genMeshCube(_ width: Float, _ height: Float, _ length: Float) -> Mesh {
        return _RaylibC.GenMeshCube(width, height, length)
    }
    
    /// Generate sphere mesh (standard sphere)
    @_transparent
    static func genMeshSphere(_ radius: Float, _ rings: Int32, _ slices: Int32) -> Mesh {
        return _RaylibC.GenMeshSphere(radius, rings, slices)
    }
    
    /// Generate half-sphere mesh (no bottom cap)
    @_transparent
    static func genMeshHemiSphere(_ radius: Float, _ rings: Int32, _ slices: Int32) -> Mesh {
        return _RaylibC.GenMeshHemiSphere(radius, rings, slices)
    }
    
    /// Generate cylinder mesh
    @_transparent
    static func genMeshCylinder(_ radius: Float, _ height: Float, _ slices: Int32) -> Mesh {
        return _RaylibC.GenMeshCylinder(radius, height, slices)
    }
    
    /// Generate torus mesh
    @_transparent
    static func genMeshTorus(_ radius: Float, _ size: Float, _ radSeg: Int32, _ sides: Int32) -> Mesh {
        return _RaylibC.GenMeshTorus(radius, size, radSeg, sides)
    }
    
    /// Generate trefoil knot mesh
    @_transparent
    static func genMeshKnot(_ radius: Float, _ size: Float, _ radSeg: Int32, _ sides: Int32) -> Mesh {
        return _RaylibC.GenMeshKnot(radius, size, radSeg, sides)
    }
    
    /// Generate heightmap mesh from image data
    @_transparent
    static func genMeshHeightmap(_ heightmap: Image, _ size: Vector3) -> Mesh {
        return _RaylibC.GenMeshHeightmap(heightmap, size)
    }
    
    /// Generate cubes-based map mesh from image data
    @_transparent
    static func genMeshCubicmap(_ cubicmap: Image, _ cubeSize: Vector3) -> Mesh {
        return _RaylibC.GenMeshCubicmap(cubicmap, cubeSize)
    }
    
    //MARK: - Mesh manipulation functions
    
    /// Compute mesh bounding box limits
    @_transparent
    static func meshBoundingBox(_ mesh: Mesh) -> BoundingBox {
        return _RaylibC.MeshBoundingBox(mesh)
    }
    
    /// Compute mesh tangents
    @_transparent
    static func meshTangents(_ mesh: inout Mesh) {
        _RaylibC.MeshTangents(&mesh)
    }
    
    /// Compute mesh binormals
    @_transparent
    static func meshBinormals(_ mesh: inout Mesh) {
        _RaylibC.MeshBinormals(&mesh)
    }
    
    //MARK: - Model drawing functions
    
    /// Draw a model (with texture if set)
    @_transparent
    static func drawModel(_ model: Model, _ position: Vector3, _ scale: Float, _ tint: Color) {
        _RaylibC.DrawModel(model, position, scale, tint)
    }
    
    /// Draw a model with extended parameters
    @_transparent
    static func drawModelEx(_ model: Model, _ position: Vector3, _ rotationAxis: Vector3, _ rotationAngle: Float, _ scale: Vector3, _ tint: Color) {
        _RaylibC.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint)
    }
    
    /// Draw a model wires (with texture if set)
    @_transparent
    static func drawModelWires(_ model: Model, _ position: Vector3, _ scale: Float, _ tint: Color) {
        _RaylibC.DrawModelWires(model, position, scale, tint)
    }
    
    /// Draw a model wires (with texture if set) with extended parameters
    @_transparent
    static func drawModelWiresEx(_ model: Model, _ position: Vector3, _ rotationAxis: Vector3, _ rotationAngle: Float, _ scale: Vector3, _ tint: Color) {
        _RaylibC.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint)
    }
    
    /// Draw bounding box (wires)
    @_transparent
    static func drawBoundingBox(_ box: BoundingBox, _ color: Color) {
        _RaylibC.DrawBoundingBox(box, color)
    }
    
    /// Draw a billboard texture
    @_transparent
    static func drawBillboard(_ camera: Camera, _ texture: Texture2D, _ center: Vector3, _ size: Float, _ tint: Color) {
        _RaylibC.DrawBillboard(camera, texture, center, size, tint)
    }
    
    /// Draw a billboard texture defined by source
    @_transparent
    static func drawBillboardRec(_ camera: Camera, _ texture: Texture2D, _ source: Rectangle, _ center: Vector3, _ size: Float, _ tint: Color) {
        _RaylibC.DrawBillboardRec(camera, texture, source, center, size, tint)
    }
    
    //MARK: - Collision detection functions
    
    /// Detect collision between two spheres
    @_transparent
    static func checkCollisionSpheres(_ center1: Vector3, _ radius1: Float, _ center2: Vector3, _ radius2: Float) -> Bool {
        let result = _RaylibC.CheckCollisionSpheres(center1, radius1, center2, radius2)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect collision between two bounding boxes
    @_transparent
    static func checkCollisionBoxes(_ box1: BoundingBox, _ box2: BoundingBox) -> Bool {
        let result = _RaylibC.CheckCollisionBoxes(box1, box2)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect collision between box and sphere
    @_transparent
    static func checkCollisionBoxSphere(_ box: BoundingBox, _ center: Vector3, _ radius: Float) -> Bool {
        let result = _RaylibC.CheckCollisionBoxSphere(box, center, radius)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect collision between ray and sphere
    @_transparent
    static func checkCollisionRaySphere(_ ray: Ray, _ center: Vector3, _ radius: Float) -> Bool {
        let result = _RaylibC.CheckCollisionRaySphere(ray, center, radius)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Detect collision between ray and sphere, returns collision point
    @_transparent
    static func checkCollisionRaySphereEx(_ ray: Ray, _ center: Vector3, _ radius: Float) -> Vector3? {
        var collisionPoint = Vector3()
        let result = _RaylibC.CheckCollisionRaySphereEx(ray, center, radius, &collisionPoint)
#if os(Windows)
        if result.rawValue != 0 {
            return collisionPoint
        }
#else
        if result {
            return collisionPoint
        }
#endif
        return nil
    }
    
    /// Detect collision between ray and box
    @_transparent
    static func checkCollisionRayBox(_ ray: Ray, _ box: BoundingBox) -> Bool {
        let result = _RaylibC.CheckCollisionRayBox(ray, box)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get collision info between ray and mesh
    @_transparent
    static func getCollisionRayMesh(_ ray: Ray, _ mesh: Mesh, _ transform: Matrix) -> RayHitInfo {
        return _RaylibC.GetCollisionRayMesh(ray, mesh, transform)
    }
    
    /// Get collision info between ray and model
    @_transparent
    static func getCollisionRayModel(_ ray: Ray, _ model: Model) -> RayHitInfo {
        return _RaylibC.GetCollisionRayModel(ray, model)
    }
    
    /// Get collision info between ray and triangle
    @_transparent
    static func getCollisionRayTriangle(_ ray: Ray, _ p1: Vector3, _ p2: Vector3, _ p3: Vector3) -> RayHitInfo {
        return _RaylibC.GetCollisionRayTriangle(ray, p1, p2, p3)
    }
    
    /// Get collision info between ray and ground plane (Y-normal plane)
    @_transparent
    static func getCollisionRayGround(_ ray: Ray, _ groundHeight: Float) -> RayHitInfo {
        return _RaylibC.GetCollisionRayGround(ray, groundHeight)
    }
}
