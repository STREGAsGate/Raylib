/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension Raylib {
    //MARK: - Files management functions
    
    /// Load file data as byte array (read)
    @_transparent
    static func loadFileData(_ fileName: String, _ bytesRead: inout UInt32) -> UnsafeMutablePointer<UInt8>! {
        return fileName.withCString { cString in
            return _RaylibC.LoadFileData(cString, &bytesRead)
        }
    }
    
    /// Unload file data allocated by LoadFileData()
    @_transparent
    static func unloadFileData(_ data: UnsafeMutablePointer<UInt8>!) {
        _RaylibC.UnloadFileData(data)
    }
    
    /// Save data to file from byte array (write), returns true on success
    @_transparent
    static func saveFileData(_ fileName: String, _ data: UnsafeMutableRawPointer!, _ bytesToWrite: UInt32) -> Bool {
        return fileName.withCString { cString in
            let result = _RaylibC.SaveFileData(cString, data, bytesToWrite)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Load text data from file (read), returns a '\0' terminated string
    @_transparent
    static func loadFileText(_ fileName: String) -> String {
        return fileName.withCString { cString in
            return String(cString: _RaylibC.LoadFileText(cString))
        }
    }
    
    /// Unload file text data allocated by LoadFileText()
    @_transparent @available(*, unavailable, message: "Swift will handle unloading automatically.")
    static func unloadFileText(_ text: UnsafeMutablePointer<Int8>!) {
        _RaylibC.UnloadFileText(text)
    }
    
    /// Save text data to file (write), string must be '\0' terminated, returns true on success
    @_transparent
    static func saveFileText(_ fileName: String, _ text: String) -> Bool {
        return fileName.withCString { fileCString in
            var _text = text.utf8CString
            return _text.withUnsafeMutableBufferPointer { textCString in
                let result = _RaylibC.SaveFileText(fileCString, textCString.baseAddress)
#if os(Windows)
                return result.rawValue != 0
#else
                return result
#endif
            }
        }
    }
    
    /// Check if file exists
    @_transparent
    static func fileExists(_ fileName: String) -> Bool {
        return fileName.withCString { cString in
            let result = _RaylibC.FileExists(cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Check if a directory path exists
    @_transparent
    static func directoryExists(_ dirPath: String) -> Bool {
        return dirPath.withCString { cString in
            let result = _RaylibC.DirectoryExists(cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Check file extension (including point: .png, .wav)
    @_transparent
    static func isFileExtension(_ fileName: String, _ ext: String) -> Bool {
        return fileName.withCString { fileCString in
            return ext.withCString { extCString in
                let result = _RaylibC.IsFileExtension(fileCString, extCString)
#if os(Windows)
                return result.rawValue != 0
#else
                return result
#endif
            }
        }
    }
    
    /// Get pointer to extension for a filename string (includes dot: ".png")
    @_transparent
    static func getFileExtension(_ fileName: String) -> String {
        return fileName.withCString { cString in
            return String(cString: _RaylibC.GetFileExtension(cString))
        }
    }
    
    /// Get pointer to filename for a path string
    @_transparent
    static func getFileName(_ filePath: String) -> String {
        return filePath.withCString { cString in
            return String(cString: _RaylibC.GetFileName(cString))
        }
    }
    
    /// Get filename string without extension (uses static string)
    @_transparent
    static func getFileNameWithoutExt(_ filePath: String) -> String {
        return filePath.withCString { cString in
            return String(cString: _RaylibC.GetFileNameWithoutExt(cString))
        }
    }
    
    /// Get full path for a given fileName with path (uses static string)
    @_transparent
    static func getDirectoryPath(_ filePath: String) -> String {
        return filePath.withCString { cString in
            return String(cString: _RaylibC.GetDirectoryPath(cString))
        }
    }
    
    /// Get previous directory path for a given path (uses static string)
    @_transparent
    static func getPrevDirectoryPath(_ dirPath: String) -> String {
        return dirPath.withCString { cString in
            return String(cString: _RaylibC.GetPrevDirectoryPath(cString))
        }
    }
    
    /// Get current working directory (uses static string)
    @_transparent
    static func getWorkingDirectory() -> String {
        return String(cString: _RaylibC.GetWorkingDirectory())
    }
    
    /// Get filenames in a directory path (memory should be freed)
    @_transparent
    static func getDirectoryFiles(_ dirPath: String) -> [String] {
        return dirPath.withCString { cString in
            var count: Int32 = 0
            let result = _RaylibC.GetDirectoryFiles(cString, &count)
            let buffer = UnsafeMutableBufferPointer(start: result, count: Int(count))
            return buffer.compactMap({$0}).map({String(cString: $0)})
        }
    }
    
    /// Clear directory files paths buffers (free memory)
    @_transparent
    static func clearDirectoryFiles() {
        _RaylibC.ClearDirectoryFiles()
    }
    
    /// Change working directory, return true on success
    @_transparent
    static func changeDirectory(_ dir: String) -> Bool {
        return dir.withCString { cString in
            let result = _RaylibC.ChangeDirectory(cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Check if a file has been dropped into window
    @_transparent
    static var isFileDropped: Bool {
        let result = _RaylibC.IsFileDropped()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Get dropped files names (memory should be freed)
    @_transparent
    static func getDroppedFiles() -> [String] {
        var count: Int32 = 0
        let result = _RaylibC.GetDroppedFiles(&count)
        let buffer = UnsafeMutableBufferPointer(start: result, count: Int(count))
        return buffer.compactMap({$0}).map({String(cString: $0)})
    }
    
    /// Clear dropped files paths buffer (free memory)
    @_transparent
    static func clearDroppedFiles() {
        _RaylibC.ClearDroppedFiles()
    }
    
    /// Get file modification time (last write time)
    @_transparent
    static func getFileModTime(_ fileName: String) -> Int64 {
        return fileName.withCString { cString -> Int64 in
            return Int64(_RaylibC.GetFileModTime(cString))
        }
    }
    
    /// Compress data (DEFLATE algorithm)
    @_transparent
    static func compressData(_ data: UnsafeMutablePointer<UInt8>!, _ dataLength: Int32, _ compDataLength: inout Int32) -> UnsafeMutablePointer<UInt8>! {
        return _RaylibC.CompressData(data, dataLength, &compDataLength)
    }
    
    /// Decompress data (DEFLATE algorithm)
    @_transparent
    static func decompressData(_ compData: UnsafeMutablePointer<UInt8>!, _ compDataLength: Int32, _ dataLength: inout Int32) -> UnsafeMutablePointer<UInt8>! {
        return _RaylibC.DecompressData(compData, compDataLength, &dataLength)
    }
    
    //MARK: - Persistent storage management
    
    /// Save integer value to storage file (to defined position), returns true on success
    @_transparent
    static func saveStorageValue(_ position: UInt32, _ value: Int32) -> Bool {
        let result = _RaylibC.SaveStorageValue(position, value)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Load integer value from storage file (from defined position)
    @_transparent
    static func loadStorageValue(_ position: UInt32) -> Int32 {
        return _RaylibC.LoadStorageValue(position)
    }
    
    /// Open URL with default system browser (if available)
    @_transparent
    static func openURL(_ url: String) {
        url.withCString { cString in
            _RaylibC.OpenURL(cString)
        }
    }
}
