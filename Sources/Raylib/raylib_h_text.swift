/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

//------------------------------------------------------------------------------------
// Font Loading and Text Drawing Functions (Module: text)
//------------------------------------------------------------------------------------
//MARK: - Font loading/unloading functions
public extension Raylib {
    /// Get the default Font
    @inlinable
    static func getFontDefault() -> Font {
        return _RaylibC.GetFontDefault()
    }
    
    /// Load font from file into GPU memory (VRAM)
    @inlinable
    static func loadFont(_ fileName: String) -> Font {
        fileName.withCString { cString in
            _RaylibC.LoadFont(cString)
        }
    }
    
    /// Load font from file with extended parameters
    @inlinable
    static func loadFontEx(_ fileName: String, _ fontSize: Int32, _ fontChars: [Character]) -> Font {
        return fileName.withCString { cString in
            var chars: [Int32] = fontChars.compactMap({$0.utf8.first}).map({Int32($0)})
            return chars.withUnsafeMutableBufferPointer { bufferPointer in
                return _RaylibC.LoadFontEx(cString, fontSize, bufferPointer.baseAddress, Int32(bufferPointer.count))
            }
        }
    }
    
    /// Load font from Image (XNA style)
    @inlinable
    static func loadFontFromImage(_ image: Image, _ key: Color, _ firstChar: Int32) -> Font {
        return _RaylibC.LoadFontFromImage(image, key, firstChar)
    }
    
    /// Load font from memory buffer, fileType refers to extension: i.e. ".ttf"
    @inlinable
    static func loadFontFromMemory(_ fileType: String, _ fileData: UnsafePointer<UInt8>!, _ dataSize: Int32, _ fontSize: Int32, _ fontChars: [Int32]) -> Font {
        return fileType.withCString { fileCString in
            var chars = fontChars
            return chars.withUnsafeMutableBufferPointer { charBytes in
                return _RaylibC.LoadFontFromMemory(fileCString, fileData, dataSize, fontSize, charBytes.baseAddress, Int32(fontChars.count))
            }
        }
    }
    
    /// Load font data for further use
    @inlinable
    static func loadFontData(_ fileData: UnsafePointer<UInt8>!, _ dataSize: Int32, _ fontSize: Int32, _ fontChars: [Int32], _ type: FontType) -> [GlyphInfo] {
        var chars = fontChars
        return chars.withUnsafeMutableBufferPointer { charBytes in
            let v = _RaylibC.LoadFontData(fileData, dataSize, fontSize, charBytes.baseAddress, Int32(charBytes.count), type.rawValue)
            return Array(UnsafeBufferPointer(start: v, count: fontChars.count))
        }
    }
    
    /// Generate image font atlas using chars info
    @inlinable @available(*, unavailable, message: "The Swift implimentation is missing...")
    static func genImageFontAtlas(_ chars: [GlyphInfo], _ recs: [Rectangle], _ fontSize: Int32, _ padding: Int32, _ packMethod: Int32) -> Image {
        fatalError("Not implimented")
    }
    
    /// Unload font chars info data (RAM)
    @inlinable
    static func unloadFontData(_ chars: [GlyphInfo]) {
        var chars = chars
        chars.withUnsafeMutableBufferPointer { bufferPointer in
            _RaylibC.UnloadFontData(bufferPointer.baseAddress, Int32(bufferPointer.count))
        }
    }
    
    /// Unload Font from GPU memory (VRAM)
    @inlinable
    static func unloadFont(_ font: Font) {
        _RaylibC.UnloadFont(font)
    }
}


//MARK: - Text drawing functions
public extension Raylib {
    /// Draw current FPS
    @inlinable
    static func drawFPS(_ posX: Int32, _ posY: Int32) {
        _RaylibC.DrawFPS(posX, posY)
    }
    
    /// Draw text (using default font)
    @inlinable
    static func drawText(_ text: String, _ posX: Int32, _ posY: Int32, _ fontSize: Int32, _ color: Color) {
        text.withCString { cString in
            _RaylibC.DrawText(cString, posX, posY, fontSize, color)
        }
    }
    
    /// Draw text using font and additional parameters
    @inlinable
    static func drawTextEx(_ font: Font, _ text: String, _ position: Vector2, _ fontSize: Float, _ spacing: Float, _ tint: Color) {
        text.withCString { cString in
            _RaylibC.DrawTextEx(font, cString, position, fontSize, spacing, tint)
        }
    }
    
    /// Draw text using Font and pro parameters (rotation)
    @inlinable
    static func drawTextPro(_ font: Font, _ text: String, _ position: Vector2, _ origin: Vector2, _ rotation: Float, _ fontSize: Float, _ spacing: Float, _ tint: Color) {
        text.withCString { cString in
            _RaylibC.DrawTextPro(font, cString, position, origin, rotation, fontSize, spacing, tint)
        }
    }
    
    /// Draw one character (codepoint)
    @inlinable
    static func drawTextCodepoint(_ font: Font, _ codepoint: Int32, _ position: Vector2, _ fontSize: Float, _ tint: Color) {
        _RaylibC.DrawTextCodepoint(font, codepoint, position, fontSize, tint)
    }
}


//MARK: - Text font info functions
public extension Raylib {
    /// Measure string width for default font
    @inlinable
    static func measureText(_ text: String, _ fontSize: Int32) -> Int32 {
        return text.withCString { cString in
            return _RaylibC.MeasureText(cString, fontSize)
        }
    }
    
    /// Measure string size for Font
    @inlinable
    static func measureTextEx(_ font: Font, _ text: String, _ fontSize: Float, _ spacing: Float) -> Vector2 {
        return text.withCString { cString in
            return _RaylibC.MeasureTextEx(font, cString, fontSize, spacing)
        }
    }
    
    /// Get index position for a unicode character on font
    @inlinable
    static func getGlyphIndex(_ font: Font, _ codepoint: Int32) -> Int32 {
        return _RaylibC.GetGlyphIndex(font, codepoint)
    }
    
    /// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
    @inlinable
    static func getGlyphInfo(_ font: Font, _ codepoint: Int32) -> GlyphInfo {
        return _RaylibC.GetGlyphInfo(font, codepoint)
    }
    
    /// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
    @inlinable
    static func GetGlyphAtlasRec(_ font: Font, _ codepoint: Int32) -> Rectangle {
        return _RaylibC.GetGlyphAtlasRec(font, codepoint)
    }
}


//MARK: - Text codepoints management functions (unicode characters)
public extension Raylib {
    /// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
    @available(*, unavailable, message: "Swift has it's own UTF support. Use String and Character APIs.")
    static func loadCodepoints(_ text: String) -> [Int32] {
        return text.withCString { cString in
            var count: Int32 = -1
            let codePointsPointer = _RaylibC.LoadCodepoints(cString, &count)
            let buffer = UnsafeMutableBufferPointer<Int32>(start: codePointsPointer, count: Int(count))
            let array = Array(buffer)
            // Swift will maintian its own memory so we ask raylib to cleanup.= now.
            _RaylibC.UnloadCodepoints(codePointsPointer)
            return array
        }
    }
    
    /// Unload codepoints data from memory
    @available(*, unavailable, message: "Swift has it's own UTF support. Use String and Character APIs.")
    static func unloadCodepoints(_ codepoints: UnsafeMutablePointer<Int32>!) {
        fatalError()
    }
    
    /// Get total number of codepoints in a UTF-8 encoded string
    @available(*, unavailable, message: "Swift has it's own UTF support. Use String and Character APIs.")
    static func getCodepointCount(_ text: UnsafePointer<CChar>!) -> Int32 {
        fatalError()
    }
    
    /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
    @available(*, unavailable, message: "Swift has it's own UTF support. Use String and Character APIs.")
    static func getCodepoint(_ text: UnsafePointer<CChar>!, _ bytesProcessed: UnsafeMutablePointer<Int32>!) -> Int32 {
        fatalError()
    }
    
    /// Encode one codepoint into UTF-8 byte array (array length returned as parameter)
    @available(*, unavailable, message: "Swift has it's own UTF support. Use String and Character APIs.")
    static func codepointToUTF8(_ codepoint: Int32, _ byteSize: UnsafeMutablePointer<Int32>!) -> UnsafePointer<CChar>! {
        fatalError()
    }
    
    /// Encode text as codepoints array into UTF-8 text string (WARNING: memory must be freed!)
    @available(*, unavailable, message: "Swift has it's own UTF support. Use String and Character APIs.")
    static func textCodepointsToUTF8(_ codepoints: UnsafeMutablePointer<Int32>!, _ length: Int32) -> UnsafeMutablePointer<CChar>! {
        fatalError()
    }
}


//MARK: - Text strings management functions (no utf8 strings, only byte chars)
public extension Raylib {
    /// Copy one string to another, returns bytes copied
    @available(*, unavailable, message: "Use Swift String API.")
    @inlinable
    static func textCopy(_ dst: inout String, _ src: String) -> Int32 {
        fatalError()
    }
    
    /// Check if two text string are equal
    @available(*, deprecated, message: "Use Swift String API.")
    @inlinable
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
    @available(*, deprecated, message: "Use Swift String API.")
    @inlinable
    static func textLength(_ text: String) -> UInt32 {
        return text.withCString { cString in
            return _RaylibC.TextLength(cString)
        }
    }
    
    /// Get a piece of a text string
    @available(*, deprecated, message: "Use Swift String API.")
    @inlinable
    static func textSubtext(_ text: String, _ position: Int32, _ length: Int32) -> String {
        return text.withCString { cString in
            return String(cString: _RaylibC.TextSubtext(cString, position, length))
        }
    }
    
    /// Replace text string (memory must be freed!)
    @available(*, unavailable, message: "Use `String.replacingOccurrences(of: _, with: _)` API.")
    @inlinable
    static func textReplace(_ text: String, _ replace: String, _ by: String) -> String {
        fatalError()
    }
    
    /// Insert text in a position (memory must be freed!)
    @available(*, unavailable, message: "Use `String.insert(_:, at:)` API.")
    @inlinable
    static func textInsert(_ text: UnsafePointer<CChar>!, _ insert: UnsafePointer<CChar>!, _ position: Int32) -> UnsafeMutablePointer<CChar>! {
        fatalError()
    }
    
    /// Join text strings with delimiter
    @available(*, unavailable, message: "Use `String.append(_:)`.")
    @inlinable
    static func textJoin(_ textList: UnsafeMutablePointer<UnsafePointer<CChar>?>!, _ count: Int32, _ delimiter: UnsafePointer<CChar>!) -> UnsafePointer<CChar>! {
        fatalError()
    }
    
    /// Split text into multiple strings
    @available(*, unavailable, message: "Use `String.components(separatedBy:)`.")
    @inlinable
    static func textSplit(_ text: UnsafePointer<CChar>!, _ delimiter: CChar, _ count: UnsafeMutablePointer<Int32>!) -> UnsafeMutablePointer<UnsafePointer<CChar>?>! {
        fatalError()
    }
    
    /// Append text at specific position and move cursor!
    @available(*, unavailable, message: "Use `String.insert(_:, at:)`.")
    @inlinable
    static func textAppend(_ text: String, _ append: String, _ position: Int32) {
        fatalError()
    }
    
    /// Find first text occurrence within a string
    @available(*, deprecated, message: "Use `String.firstIndex(of: String)`.")
    @inlinable
    static func textFindIndex(_ text: String, _ find: String) -> Int32 {
        return text.withCString { cText in
            return find.withCString { cFind in
                return _RaylibC.TextFindIndex(cText, cFind)
            }
        }
    }
    
    /// Get upper case version of provided string
    @available(*, deprecated, message: "Use `String.uppercased()`.")
    @inlinable
    static func textToUpper(_ text: String) -> String {
        return text.withCString { cString in
            return String(cString: _RaylibC.TextToUpper(cString))
        }
    }
    
    /// Get lower case version of provided string
    @available(*, deprecated, message: "Use `String.lowercassed()`.")
    @inlinable
    static func textToLower(_ text: String) -> String {
        return text.withCString { cString in
            return String(cString: _RaylibC.TextToLower(cString))
        }
    }
    
    /// Get Pascal case notation version of provided string
    @inlinable
    static func textToPascal(_ text: String) -> String {
        return text.withCString { cString in
            return String(cString: _RaylibC.TextToPascal(cString))
        }
    }
    
    /// Get integer value from text (negative values not supported)
    @available(*, deprecated, message: "Use `Int32?(_ string: String)`.")
    @inlinable
    static func textToInteger(_ text: String) -> Int32 {
        return text.withCString { cString in
            return _RaylibC.TextToInteger(cString)
        }
    }
}
