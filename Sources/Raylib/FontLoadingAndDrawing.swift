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
    // Font Loading and Text Drawing Functions (Module: text)
    //------------------------------------------------------------------------------------
    //
    
    //MARK: - Font loading/unloading functions
    
    /// Get the default Font
    @_transparent
    static func getFontDefault() -> Font {
        return _RaylibC.GetFontDefault()
    }
    
    /// Load font from file into GPU memory (VRAM)
    @_transparent
    static func loadFont(_ fileName: String) -> Font {
        fileName.withCString { cString in
            _RaylibC.LoadFont(cString)
        }
    }
    
    /// Load font from file with extended parameters
    @_transparent
    static func loadFontEx(_ fileName: String, _ fontSize: Int32, _ fontChars: [Character]) -> Font {
        return fileName.withCString { cString in
            var chars: [Int32] = fontChars.compactMap({$0.utf8.first}).map({Int32($0)})
            return chars.withUnsafeMutableBufferPointer { bufferPointer in
                return _RaylibC.LoadFontEx(cString, fontSize, bufferPointer.baseAddress, Int32(bufferPointer.count))
            }
        }
    }
    
    /// Load font from Image (XNA style)
    @_transparent
    static func loadFontFromImage(_ image: Image, _ key: Color, _ firstChar: Int32) -> Font {
        return _RaylibC.LoadFontFromImage(image, key, firstChar)
    }
    
    /// Load font from memory buffer, fileType refers to extension: i.e. ".ttf"
    @_transparent
    static func loadFontFromMemory(_ fileType: String, _ fileData: UnsafePointer<UInt8>!, _ dataSize: Int32, _ fontSize: Int32, _ fontChars: [Int32]) -> Font {
        return fileType.withCString { fileCString in
            var chars = fontChars
            return chars.withUnsafeMutableBufferPointer { charBytes in
                return _RaylibC.LoadFontFromMemory(fileCString, fileData, dataSize, fontSize, charBytes.baseAddress, Int32(fontChars.count))
            }
        }
    }
    
    /// Load font data for further use
    @_transparent
    static func loadFontData(_ fileData: UnsafePointer<UInt8>!, _ dataSize: Int32, _ fontSize: Int32, _ fontChars: [Int32], _ type: FontType) -> [GlyphInfo] {
        var chars = fontChars
        return chars.withUnsafeMutableBufferPointer { charBytes in
            let v = _RaylibC.LoadFontData(fileData, dataSize, fontSize, charBytes.baseAddress, Int32(charBytes.count), type.rawValue)
            return Array(UnsafeBufferPointer(start: v, count: fontChars.count))
        }
    }
    
    /// Generate image font atlas using chars info
    @_transparent @available(*, unavailable, message: "The Swift implimentation is missing...")
    static func genImageFontAtlas(_ chars: [GlyphInfo], _ recs: [Rectangle], _ fontSize: Int32, _ padding: Int32, _ packMethod: Int32) -> Image {
        fatalError("Not implimented")
    }
    
    /// Unload font chars info data (RAM)
    @_transparent
    static func unloadFontData(_ chars: [GlyphInfo]) {
        var chars = chars
        chars.withUnsafeMutableBufferPointer { bufferPointer in
            _RaylibC.UnloadFontData(bufferPointer.baseAddress, Int32(bufferPointer.count))
        }
    }
    
    /// Unload Font from GPU memory (VRAM)
    @_transparent
    static func unloadFont(_ font: Font) {
        _RaylibC.UnloadFont(font)
    }
    
    //MARK: - Text drawing functions
    
    /// Draw current FPS
    @_transparent
    static func drawFPS(_ posX: Int32, _ posY: Int32) {
        _RaylibC.DrawFPS(posX, posY)
    }
    
    /// Draw text (using default font)
    @_transparent
    static func drawText(_ text: String, _ posX: Int32, _ posY: Int32, _ fontSize: Int32, _ color: Color) {
        text.withCString { cString in
            _RaylibC.DrawText(cString, posX, posY, fontSize, color)
        }
    }
    
    /// Draw text using font and additional parameters
    @_transparent
    static func drawTextEx(_ font: Font, _ text: String, _ position: Vector2, _ fontSize: Float, _ spacing: Float, _ tint: Color) {
        text.withCString { cString in
            _RaylibC.DrawTextEx(font, cString, position, fontSize, spacing, tint)
        }
    }
    
    /// Draw text using Font and pro parameters (rotation)
    @_transparent
    static func drawTextPro(_ font: Font, _ text: String, _ position: Vector2 , _ origin: Vector2, _ rotation: Float, _ fontSize: Float, _ spacing: Float, _ tint: Color) {
        text.withCString { cString in
            _RaylibC.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint)
        }
    }
    
    /// Draw one character (codepoint)
    @_transparent
    static func drawTextCodepoint(_ font: Font, _ codepoint: Int32, _ position: Vector2, _ fontSize: Float, _ tint: Color) {
        _RaylibC.DrawTextCodepoint(font, codepoint, position, fontSize, tint)
    }
    
    //MARK: - Text misc. functions
    
    /// Measure string width for default font
    @_transparent
    static func measureText(_ text: String, _ fontSize: Int32) -> Int32 {
        return text.withCString { cString in
            return _RaylibC.MeasureText(cString, fontSize)
        }
    }
    
    /// Measure string size for Font
    @_transparent
    static func measureTextEx(_ font: Font, _ text: String, _ fontSize: Float, _ spacing: Float) -> Vector2 {
        return text.withCString { cString in
            return _RaylibC.MeasureTextEx(font, cString, fontSize, spacing)
        }
    }
    
    /// Get index position for a unicode character on font
    @_transparent
    static func getGlyphIndex(_ font: Font, _ codepoint: Int32) -> Int32 {
        return _RaylibC.GetGlyphIndex(font, codepoint)
    }
    
    //MARK: - Text strings management functions (no utf8 strings, only byte chars)
    // NOTE: Some strings allocate memory internally for returned strings, just be careful!
    
    /// Copy one string to another, returns bytes copied
    @_transparent @available(*, unavailable, message: "Use Swift String API.")
    static func textCopy(_ dst: inout String, _ src: String) -> Int32 {
        fatalError()
    }
    
    /// Check if two text string are equal
    @_transparent @available(*, deprecated, message: "Use Swift String API.")
    static func textIsEqual(_ text1: String, _ text2: String) -> Bool {
        return text1.withCString { text1CString in
            return text2.withCString { text2CString in
                let result = _RaylibC.TextIsEqual(text1CString, text2CString)
#if os(Windows)
                return result.rawValue != 0
#else
                return result
#endif
            }
        }
    }
    
    /// Get text length, checks for '\0' ending
    @_transparent @available(*, deprecated, message: "Use Swift String API.")
    static func textLength(_ text: String) -> UInt32 {
        return text.withCString { cString in
            return _RaylibC.TextLength(cString)
        }
    }
    
    /// Get a piece of a text string
    @_transparent @available(*, deprecated, message: "Use Swift String API.")
    static func textSubtext(_ text: String, _ position: Int32, _ length: Int32) -> String {
        return text.withCString { cString in
            return String(cString: _RaylibC.TextSubtext(cString, position, length))
        }
    }
    
    /// Replace text string (memory must be freed!)
    @_transparent @available(*, unavailable, message: "Use `String.replacingOccurrences(of: _, with: _)` API.")
    static func textReplace(_ text: String, _ replace: String, _ by: String) -> String {
        fatalError()
    }
    
    /// Insert text in a position (memory must be freed!)
    @_transparent @available(*, unavailable, message: "Use `String.insert(_:, at:)` API.")
    static func textInsert(_ text: UnsafePointer<CChar>!, _ insert: UnsafePointer<CChar>!, _ position: Int32) -> UnsafeMutablePointer<CChar>! {
        fatalError()
    }
    
    /// Join text strings with delimiter
    @_transparent @available(*, unavailable, message: "Use `String.append(_:)`.")
    static func textJoin(_ textList: UnsafeMutablePointer<UnsafePointer<CChar>?>!, _ count: Int32, _ delimiter: UnsafePointer<CChar>!) -> UnsafePointer<CChar>! {
        fatalError()
    }
    
    /// Split text into multiple strings
    @_transparent @available(*, unavailable, message: "Use `String.components(separatedBy:)`.")
    static func textSplit(_ text: UnsafePointer<CChar>!, _ delimiter: CChar, _ count: UnsafeMutablePointer<Int32>!) -> UnsafeMutablePointer<UnsafePointer<CChar>?>! {
        fatalError()
    }
    
    /// Append text at specific position and move cursor!
    @_transparent @available(*, unavailable, message: "Use `String.insert(_:, at:)`.")
    static func textAppend(_ text: String, _ append: String, _ position: Int32) {
        fatalError()
    }
    
    /// Find first text occurrence within a string
    @_transparent @available(*, deprecated, message: "Use `String.firstIndex(of: String)`.")
    static func textFindIndex(_ text: String, _ find: String) -> Int32 {
        return text.withCString { cText in
            return find.withCString { cFind in
                return _RaylibC.TextFindIndex(cText, cFind)
            }
        }
    }
    
    /// Get upper case version of provided string
    @_transparent @available(*, deprecated, message: "Use `String.uppercased()`.")
    static func textToUpper(_ text: String) -> String {
        return text.withCString { cString in
            return String(cString: _RaylibC.TextToUpper(cString))
        }
    }
    
    /// Get lower case version of provided string
    @_transparent @available(*, deprecated, message: "Use `String.lowercassed()`.")
    static func textToLower(_ text: String) -> String {
        return text.withCString { cString in
            return String(cString: _RaylibC.TextToLower(cString))
        }
    }
    
    /// Get Pascal case notation version of provided string
    @_transparent
    static func textToPascal(_ text: String) -> String {
        return text.withCString { cString in
            return String(cString: _RaylibC.TextToPascal(cString))
        }
    }
    
    /// Get integer value from text (negative values not supported)
    @_transparent @available(*, deprecated, message: "Use `Int32?(_ string: String)`.")
    static func textToInteger(_ text: String) -> Int32 {
        return text.withCString { cString in
            return _RaylibC.TextToInteger(cString)
        }
    }
    
//    /// Encode text codepoint into utf8 text (memory must be freed!)
//    @_transparent @available(*, deprecated, message: "Use `String.utf8` with `String.init(_ utf8: String.UTF8View)`.")
//    static func textToUtf8(_ codepoints: [Int32]) -> String {
//        var codepoints = codepoints
//        return codepoints.withUnsafeMutableBufferPointer { bufferPointer in
//            return String(cString: _RaylibC.TextToUtf8(bufferPointer.baseAddress, Int32(bufferPointer.count)))
//        }
//    }
//    
//    //MARK: - UTF8 text strings management functions
//    
//    /// Get all codepoints in a string, codepoints count returned by parameters
//    @_transparent @available(*, deprecated, message: "Use `String.unicodeScalars`.")
//    static func getCodepoints(_ text: String) -> [Int32] {
//        return text.withCString { cString in
//            var count: Int32 = Int32(text.count)
//            let start = _RaylibC.GetCodepoints(cString, &count)
//            return Array(UnsafeBufferPointer<Int32>(start: start, count: Int(count)))
//        }
//    }
//    
//    /// Get total number of characters (codepoints) in a UTF8 encoded string
//    @_transparent @available(*, deprecated, message: "Use `String.unicodeScalars.count`.")
//    static func getCodepointsCount(_ text: String) -> Int32 {
//        return text.withCString { cString in
//            return _RaylibC.GetCodepointsCount(cString)
//        }
//    }
//    
//    /// Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
//    @_transparent @available(*, deprecated, message: "Use `String.unicodeScalars.count`.")
//    static func getNextCodepoint(_ text: String, _ bytesProcessed: inout Int32) -> Int32 {
//        return text.withCString { cString in
//            return _RaylibC.GetNextCodepoint(cString, &bytesProcessed)
//        }
//    }
//    
//    /// Encode codepoint into utf8 text (char array length returned as parameter)
//    @_transparent @available(*, deprecated, message: "Use `String.utf8` with `String.init(_ utf8: String.UTF8View)`.")
//    static func codepointToUtf8(_ codepoint: Int32, _ byteLength: UnsafeMutablePointer<Int32>!) -> UnsafePointer<CChar>! {
//        return _RaylibC.CodepointToUtf8(codepoint, byteLength)
//    }
}
