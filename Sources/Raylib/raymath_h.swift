/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

//MARK: - Module Functions Definition - Utils math
public extension Raylib {
    /// Clamp float value
    @inlinable
    static func clamp(_ value: Float, _ min: Float, _ max: Float) -> Float {
        return _RaylibC.Clamp(value, min, max)
    }
    
    /// Calculate linear interpolation between two floats
    @inlinable
    static func lerp(_ start: Float, _ end: Float, _ amount: Float) -> Float {
        return _RaylibC.Lerp(start, end, amount)
    }
    
    /// Normalize input value within input range
    @inlinable
    static func normalize(_ value: Float, _ start: Float, _ end: Float) -> Float {
        return _RaylibC.Normalize(value, start, end)
    }
    
    /// Remap input value within input range to output range
    @inlinable
    static func remap(_ value: Float, _ inputStart: Float, _ inputEnd: Float, _ outputStart: Float, _ outputEnd: Float) -> Float {
        return _RaylibC.Remap(value, inputStart, inputEnd, outputStart, outputEnd)
    }
}

//MARK: - Module Functions Definition - Vector2 math
public extension Vector2 {
    /// Vector with components value 0.0f
    @inlinable
    static var zero: Vector2 {
        return _RaylibC.Vector2Zero()
    }
    
    /// Vector with components value 1.0f
    @inlinable
    static var one: Vector2 {
        return _RaylibC.Vector2One()
    }
    
    /// Add two vectors (v1 + v2)
    @inlinable
    static func +(_ lhs: Vector2, _ rhs: Vector2) -> Vector2 {
        return _RaylibC.Vector2Add(lhs, rhs)
    }
    
    /// Add vector and float value
    @inlinable
    static func +(_ lhs: Vector2, _ rhs: Float) -> Vector2 {
        return _RaylibC.Vector2AddValue(lhs, rhs)
    }
    
    /// Subtract two vectors (v1 - v2)
    @inlinable
    static func -(_ lhs: Vector2, _ rhs: Vector2) -> Vector2 {
        return _RaylibC.Vector2Subtract(lhs, rhs)
    }
    
    /// Subtract vector by float value
    @inlinable
    static func -(_ lhs: Vector2, _ rhs: Float) -> Vector2 {
        return _RaylibC.Vector2SubtractValue(lhs, rhs)
    }
    
    /// Calculate vector length
    @inlinable
    var length: Float {
        return _RaylibC.Vector2Length(self)
    }
    
    /// Calculate vector square length
    @inlinable
    var lengthSqr: Float {
        return _RaylibC.Vector2LengthSqr(self)
    }
    
    /// Calculate two vectors dot product
    @inlinable
    func dotProduct(_ v2: Vector2) -> Float {
        return _RaylibC.Vector2DotProduct(self, v2)
    }
    
    /// Calculate distance between two vectors
    @inlinable
    func distance(_ v2: Vector2) -> Float {
        return _RaylibC.Vector2Distance(self, v2)
    }
    
    /// Calculate angle from two vectors in X-axis
    @inlinable
    func angle(_ v2: Vector2) -> Float {
        return _RaylibC.Vector2Angle(self, v2)
    }
    
    /// Scale vector (multiply by value)
    @inlinable
    func scale(_ scale: Float) -> Vector2 {
        return _RaylibC.Vector2Scale(self, scale)
    }
    
    /// Multiply vector by vector
    @inlinable
    static func *(_ v1: Vector2, _ v2: Vector2) -> Vector2 {
        return _RaylibC.Vector2Multiply(v1, v2)
    }
    
    /// Negate vector
    @inlinable
    static prefix func -(_ v: Vector2) -> Vector2 {
        return _RaylibC.Vector2Negate(v)
    }
    
    /// Divide vector by vector
    @inlinable
    static func /(_ v1: Vector2, _ v2: Vector2) -> Vector2 {
        return _RaylibC.Vector2Divide(v1, v2)
    }
    
    /// Normalize provided vector
    @inlinable
    func normalized() -> Vector2 {
        return _RaylibC.Vector2Normalize(self)
    }
    
    /// Calculate linear interpolation between two vectors
    @inlinable
    func lerp(_ v2: Vector2, _ amount: Float) -> Vector2 {
        return _RaylibC.Vector2Lerp(self, v2, amount)
    }
    
    /// Calculate reflected vector to normal
    @inlinable
    func reflect(_ normal: Vector2) -> Vector2 {
        return _RaylibC.Vector2Reflect(self, normal)
    }
    
    /// Rotate Vector by float in Degrees.
    @inlinable
    func rotate(_ degs: Float) -> Vector2 {
        return _RaylibC.Vector2Rotate(self, degs)
    }
    
    /// Move Vector towards target
    @inlinable
    func moveTowards(_ target: Vector2, _ maxDistance: Float) -> Vector2 {
        return _RaylibC.Vector2MoveTowards(self, target, maxDistance)
    }
}


//MARK: - Module Functions Definition - Vector3 math
public extension Vector3 {
    /// Vector with components value 0.0f
    @inlinable
    static var zero: Vector3 {
        return _RaylibC.Vector3Zero()
    }
    
    /// Vector with components value 1.0f
    @inlinable
    static var one: Vector3 {
        return _RaylibC.Vector3One()
    }
    
    /// Add two vectors
    @inlinable
    static func +(_ v1: Vector3, _ v2: Vector3) -> Vector3 {
        return _RaylibC.Vector3Add(v1, v2)
    }
    
    /// Add vector and float value
    @inlinable
    static func +(_ v: Vector3, _ add: Float) -> Vector3 {
        return _RaylibC.Vector3AddValue(v, add)
    }
    
    /// Subtract two vectors
    @inlinable
    static func -(_ v1: Vector3, _ v2: Vector3) -> Vector3 {
        return _RaylibC.Vector3Subtract(v1, v2)
    }
    
    /// Subtract vector by float value
    @inlinable
    static func -(_ v: Vector3, _ sub: Float) -> Vector3 {
        return _RaylibC.Vector3SubtractValue(v, sub)
    }
    
    /// Multiply vector by scalar
    @inlinable
    func scale(_ scalar: Float) -> Vector3 {
        return _RaylibC.Vector3Scale(self, scalar)
    }
    
    /// Multiply vector by vector
    @inlinable
    static func *(_ v1: Vector3, _ v2: Vector3) -> Vector3 {
        return _RaylibC.Vector3Multiply(v1, v2)
    }
    
    /// Calculate two vectors cross product
    @inlinable
    func crossProduct(_ v2: Vector3) -> Vector3 {
        return _RaylibC.Vector3CrossProduct(self, v2)
    }
    
    /// Calculate one vector perpendicular vector
    @inlinable
    var perpendicular: Vector3 {
        return _RaylibC.Vector3Perpendicular(self)
    }
    
    /// Calculate vector length
    @inlinable
    var length: Float {
        return _RaylibC.Vector3Length(self)
    }
    
    /// Calculate vector square length
    @inlinable
    var lengthSqr: Float {
        return _RaylibC.Vector3LengthSqr(self)
    }
    
    /// Calculate two vectors dot product
    @inlinable
    func dotProduct(_ v2: Vector3) -> Float {
        return _RaylibC.Vector3DotProduct(self, v2)
    }
    
    /// Calculate distance between two vectors
    @inlinable
    func distance(_ v2: Vector3) -> Float {
        return _RaylibC.Vector3Distance(self, v2)
    }
    
    // Negate provided vector (invert direction)
    @inlinable
    static prefix func -(_ v: Vector3) -> Vector3 {
        return _RaylibC.Vector3Negate(v)
    }
    
    // Divide vector by vector
    @inlinable
    static func /(_ v1: Vector3, _ v2: Vector3) -> Vector3 {
        return _RaylibC.Vector3Divide(v1, v2)
    }
    
    /// Normalize provided vector
    @inlinable
    var normalized: Vector3 {
        return _RaylibC.Vector3Normalize(self)
    }
}
public extension Raylib {
    /// Orthonormalize provided vectors
    /// Makes vectors normalized and orthogonal to each other
    /// Gram-Schmidt function implementation
    @inlinable
    static func orthoNormalize(_ v1: inout Vector3, _ v2: inout Vector3) {
        return _RaylibC.Vector3OrthoNormalize(&v1, &v2)
    }
}
public extension Vector3 {
    /// Transforms a Vector3 by a given Matrix
    @inlinable
    func transform(_ mat: Matrix) -> Vector3 {
        return _RaylibC.Vector3Transform(self, mat)
    }
    
    /// Transform a vector by quaternion rotation
    @inlinable
    func rotate(by q: Quaternion) -> Vector3 {
        return _RaylibC.Vector3RotateByQuaternion(self, q)
    }
    
    /// Calculate linear interpolation between two vectors
    @inlinable
    func lerp(_ v2: Vector3, _ amount: Float) -> Vector3 {
        return _RaylibC.Vector3Lerp(self, v2, amount)
    }
    
    /// Calculate reflected vector to normal
    @inlinable
    func reflect(_ normal: Vector3) -> Vector3 {
        return _RaylibC.Vector3Reflect(self, normal)
    }
}

public extension Vector3 {
    /// Return min value for each pair of components
    @inlinable
    static func minimum(_ v1: Vector3, _ v2: Vector3) -> Vector3 {
        return _RaylibC.Vector3Min(v1, v2)
    }
    
    /// Return max value for each pair of components
    @inlinable
    static func maximum(_ v1: Vector3, _ v2: Vector3) -> Vector3 {
        return _RaylibC.Vector3Max(v1, v2)
    }
}

public extension Vector3 {
    /// Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
    /// - note: Assumes P is on the plane of the triangle
    @inlinable
    func barycenter(_ a: Vector3, _ b: Vector3, _ c: Vector3) -> Vector3 {
        return _RaylibC.Vector3Barycenter(self, a, b, c)
    }
    
    /// Returns Vector3 as float array
    @inlinable
    func toFloatV() -> float3 {
        return _RaylibC.Vector3ToFloatV(self)
    }
}

//MARK: - Module Functions Definition - Matrix math
public extension Matrix {
    /// Compute matrix determinant
    @inlinable
    var determinant: Float {
        return _RaylibC.MatrixDeterminant(self)
    }
    
    // Cache the matrix values (speed optimization)
    
    /// Returns the trace of the matrix (sum of the values along the diagonal)
    @inlinable
    var trace: Float {
        return _RaylibC.MatrixTrace(self)
    }
    
    /// Transposes provided matrix
    @inlinable
    var transposed: Matrix {
        return _RaylibC.MatrixTranspose(self)
    }
    
    /// Invert provided matrix
    @inlinable
    var inverse: Matrix {
        return _RaylibC.MatrixInvert(self)
    }
    
    // Cache the matrix values (speed optimization)
    
    // Calculate the invert determinant (inlined to avoid double-caching)
    
    /// Normalize provided matrix
    @inlinable
    var normalized: Matrix {
        return _RaylibC.MatrixNormalize(self)
    }
    
    /// Returns identity matrix
    @inlinable
    static var identity: Matrix {
        return _RaylibC.MatrixIdentity()
    }
    
    /// Add two matrices
    @inlinable
    static func +(_ left: Matrix, _ right: Matrix) -> Matrix {
        return _RaylibC.MatrixAdd(left, right)
    }
    
    /// Subtract two matrices (left - right)
    @inlinable
    static func -(_ left: Matrix, _ right: Matrix) -> Matrix {
        return _RaylibC.MatrixSubtract(left, right)
    }
    
    /// Returns two matrix multiplication
    /// - note: When multiplying matrices... the order matters!
    @inlinable
    static func *(_ left: Matrix, _ right: Matrix) -> Matrix {
        return _RaylibC.MatrixMultiply(left, right)
    }
    
    /// Returns translation matrix
    @inlinable
    init(translateX x: Float, y: Float, z: Float) {
        self = _RaylibC.MatrixTranslate(x, y, z)
    }
    
    /// Create rotation matrix from axis and angle
    /// - note: Angle should be provided in radians
    @inlinable
    init(axis: Vector3, angle: Float) {
        self = _RaylibC.MatrixRotate(axis, angle)
    }
    
    /// Returns x-rotation matrix (angle in radians)
    @inlinable
    init(xAngle: Float) {
        self = _RaylibC.MatrixRotateX(xAngle)
    }
    
    /// Returns y-rotation matrix (angle in radians)
    @inlinable
    init(yAngle: Float) {
        self = _RaylibC.MatrixRotateY(yAngle)
    }
    
    /// Returns z-rotation matrix (angle in radians)
    @inlinable
    init(zAngle: Float) {
        self = _RaylibC.MatrixRotateZ(zAngle)
    }
    
    /// Returns xyz-rotation matrix (angles in radians)
    @inlinable
    init(xyzAngle: Vector3) {
        self = _RaylibC.MatrixRotateXYZ(xyzAngle)
    }
    
    /// Returns zyx-rotation matrix (angles in radians)
    @inlinable
    init(zyxAngle: Vector3) {
        self = _RaylibC.MatrixRotateZYX(zyxAngle)
    }
    
    /// Returns scaling matrix
    @inlinable
    init(scaleX x: Float, y: Float, z: Float) {
        self = _RaylibC.MatrixScale(x, y, z)
    }
    
    /// Returns perspective projection matrix
    @inlinable
    init(frustumLeft left: Double, right: Double, bottom: Double, top: Double, near: Double, far: Double){
        self = _RaylibC.MatrixFrustum(left, right, bottom, top, near, far)
    }
    
    /// Returns perspective projection matrix
    /// - note: Angle should be provided in radians
    @inlinable
    init(perspectiveFovY fovy: Double, aspect: Double, near: Double, far: Double) {
        self = _RaylibC.MatrixPerspective(fovy, aspect, near, far)
    }
    
    /// Returns orthographic projection matrix
    @inlinable
    init(orthoLeft left: Double, right: Double, bottom: Double, top: Double, near: Double, far: Double) {
        self = _RaylibC.MatrixOrtho(left, right, bottom, top, near, far)
    }
    
    /// Returns camera look-at matrix (view matrix)
    @inlinable
    init(lookAtEye eye: Vector3, target: Vector3, up: Vector3) {
        self = _RaylibC.MatrixLookAt(eye, target, up)
    }
    
    /// Returns float array of matrix data
    @inlinable
    func toFloatV() -> float16 {
        return _RaylibC.MatrixToFloatV(self)
    }
}

//MARK: - Module Functions Definition - Quaternion math
public extension Quaternion {
    /// Add two quaternions
    @inlinable
    static func +(_ q1: Quaternion, _ q2: Quaternion) -> Quaternion {
        return _RaylibC.QuaternionAdd(q1, q2)
    }
    
    /// Add quaternion and float value
    @inlinable
    static func +(_ q: Quaternion, _ add: Float) -> Quaternion {
        return _RaylibC.QuaternionAddValue(q, add)
    }
    
    /// Subtract two quaternions
    @inlinable
    static func -(_ q1: Quaternion, _ q2: Quaternion) -> Quaternion {
        return _RaylibC.QuaternionSubtract(q1, q2)
    }
    
    /// Subtract quaternion and float value
    @inlinable
    static func -(_ q: Quaternion, _ sub: Float) -> Quaternion {
        return _RaylibC.QuaternionSubtractValue(q, sub)
    }
    
    /// Returns identity quaternion
    @inlinable
    static var identity: Quaternion {
        return _RaylibC.QuaternionIdentity()
    }
    
    /// Computes the length of a quaternion
    @inlinable
    var length: Float {
        return _RaylibC.QuaternionLength(self)
    }
    
    /// Normalize provided quaternion
    @inlinable
    var normalized: Quaternion {
        return _RaylibC.QuaternionNormalize(self)
    }
    
    /// Invert provided quaternion
    @inlinable
    var inverse: Quaternion {
        return _RaylibC.QuaternionInvert(self)
    }
    
    /// Calculate two quaternion multiplication
    @inlinable
    static func *(_ q1: Quaternion, _ q2: Quaternion) -> Quaternion {
        return _RaylibC.QuaternionMultiply(q1, q2)
    }
    
    /// Scale quaternion by float value
    @inlinable
    func scale(_ mul: Float) -> Quaternion {
        return _RaylibC.QuaternionScale(self, mul)
    }
    
    /// Divide two quaternions
    @inlinable
    static func /(_ q1: Quaternion, _ q2: Quaternion) -> Quaternion {
        return _RaylibC.QuaternionDivide(q1, q2)
    }
    
    /// Calculate linear interpolation between two quaternions
    @inlinable
    func lerp(_ q2: Quaternion, _ amount: Float) -> Quaternion {
        return _RaylibC.QuaternionLerp(self, q2, amount)
    }
    
    /// Calculate slerp-optimized interpolation between two quaternions
    @inlinable
    func nLerp(_ q1: Quaternion, _ q2: Quaternion, _ amount: Float) -> Quaternion {
        return _RaylibC.QuaternionNlerp(self, q2, amount)
    }
    
    /// Calculates spherical linear interpolation between two quaternions
    @inlinable
    func sLerp(_ q1: Quaternion, _ q2: Quaternion, _ amount: Float) -> Quaternion {
        return _RaylibC.QuaternionSlerp(self, q2, amount)
    }
    
    /// Calculate quaternion based on the rotation from one vector to another
    @inlinable
    init(from: Vector3, to: Vector3) {
        self = _RaylibC.QuaternionFromVector3ToVector3(from, to)
    }
    
    // NOTE: Added QuaternioIdentity()
    
    // Normalize to essentially nlerp the original and identity to 0.5
    
    // Above lines are equivalent to:
    //Quaternion result = QuaternionNlerp(q, QuaternionIdentity(), 0.5f);
    
    /// Returns a quaternion for a given rotation matrix
    @inlinable
    init(matrix: Matrix) {
        self = _RaylibC.QuaternionFromMatrix(matrix)
    }
    
    /// Returns a matrix for a given quaternion
    @inlinable
    func toMatrix() -> Matrix {
        return _RaylibC.QuaternionToMatrix(self)
    }
    
    /// Returns rotation quaternion for an angle and axis
    /// - note: angle must be provided in radians
    @inlinable
    init(axis: Vector3, angle: Float) {
        self = _RaylibC.QuaternionFromAxisAngle(axis, angle)
    }
    
    /// Returns the rotation angle and axis for a given quaternion
    @inlinable
    func toAxisAngle() -> (axis: Vector3, angle: Float) {
        var axis: Vector3 = .zero
        var angle: Float = 0
        _RaylibC.QuaternionToAxisAngle(self, &axis, &angle)
        return (axis, angle)
    }
    
    /// Returns the quaternion equivalent to Euler angles
    /// - note: Rotation order is ZYX
    @inlinable
    init(pitch: Float, yaw: Float, roll: Float) {
        self = _RaylibC.QuaternionFromEuler(pitch, yaw, roll)
    }
    
    /// Return the Euler angles equivalent to quaternion (roll, pitch, yaw)
    /// - note: Angles are returned in a Vector3 struct in degrees
    @inlinable
    func toEuler() -> Vector3 {
        return _RaylibC.QuaternionToEuler(self)
    }
    
    /// Transform a quaternion given a transformation matrix
    @inlinable
    func transform(_ mat: Matrix) -> Quaternion {
        return _RaylibC.QuaternionTransform(self, mat)
    }
}

public extension Raylib {
    /// Projects a Vector3 from screen space into object space
    @inlinable
    static func unproject(_ source: Vector3, _ projection: Matrix, _ view: Matrix) -> Vector3 {
        return _RaylibC.Vector3Unproject(source, projection, view)
    }
}
