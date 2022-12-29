/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import RaylibC

// Style property
@_exported import struct RaylibC.GuiStyleProp

public extension Raylib {
    static let rayGuiVersion = "3.0"
}

//MARK: - Types and Structures Definition

public extension Raylib {
    /// Gui control state
    enum GuiControlState: Int32 {
        case normal = 0
        case focused
        case pressed
        case disabled
    }
    
    /// Gui control text alignment
    enum GuiTextAlignment: Int32 {
        case left = 0
        case center
        case right
    }
    
    /// Gui controls
    enum GuiControl: Int32 {
        /// Generic control -> populates to all controls when set
        case `default` = 0
        /// Used also for: LABELBUTTON
        case label
        case button
        /// Used also for: TOGGLEGROUP
        case toggle
        /// Used also for: SLIDERBAR
        case slider
        case progressbar
        case checkBox
        case comboBox
        case dropDownBox
        /// Used also for: TEXTBOXMULTI
        case textBox
        case valueBox
        case spinner
        case listView
        case colorPicker
        case scrollBar
        case statusBar
    }
    
    /// Gui base properties for every control
    /// - NOTE: RAYGUI_MAX_PROPS_BASE properties (by default 16 properties)
    enum GuiControlProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
    }
    
    /// Gui extended properties depend on control
    /// - NOTE: RAYGUI_MAX_PROPS_EXTENDED properties (by default 8 properties)
    
    /// DEFAULT extended properties
    /// - NOTE: Those properties are actually common to all controls
    enum GuiDefaultProperty: Int32 {
        case textSize = 16
        case textSpacing
        case lineColor
        case backgroundColor
    }
    
    /// Toggle/ToggleGroup
    enum GuiToggleProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case groupPadding = 16
    }
    
    /// Slider/SliderBar
    enum GuiSliderProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case sliderWidth = 16
        case sliderPadding
    }
    
    /// ProgressBar
    enum GuiProgressBarProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case progressPadding = 16
    }
    
    /// CheckBox
    enum GuiCheckBoxProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case checkPadding = 16
    }
    
    /// ComboBox
    enum GuiComboBoxProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case buttonWidth = 16
        case buttonPadding
    }
    
    /// DropdownBox
    enum GuiDropdownBoxProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case arrowPadding = 16
        case dropDownItemsPadding
    }
    
    /// TextBox/TextBoxMulti/ValueBox/Spinner
    enum GuiTextBoxProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case textInnerPadding = 16
        case textLinesPadding
        case colorSelectedForeground
        case colorSelectedBackground
    }
    
    /// Spinner
    enum GuiSpinnerProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case buttonWidth = 16
        case buttonPadding
    }
    
    /// ScrollBar
    enum GuiScrollBarProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case arrowsSize = 16
        case arrowsVisible
        case scrollSliderPadding
        case scrollSliderSize
        case scrollPadding
        case scrollSpeed
    }
    
    /// ScrollBar side
    enum GuiScrollBarSide: Int32 {
        case leftSide = 0
        case rightSide
    }
    
    /// ListView
    enum GuiListViewProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case listItemsHeight = 16
        case listItemsPadding
        case scrollBarWidth
        case scrollBarSide
    }
    
    // ColorPicker
    enum GuiColorPickerProperty: Int32 {
        case borderColorNormal = 0
        case baseColorNormal
        case textColorNormal
        case borderColorFocused
        case baseColorFocused
        case textColorFocused
        case borderColorPressed
        case baseColorPressed
        case textColorPressed
        case borderColorDisabled
        case baseColorDisabled
        case textColorDisabled
        case borderWidth
        case textPadding
        case textAlignment
        case colorSelectorSize = 16
        /// Right hue bar width
        case hueBarWidth
        /// Right hue bar separation from panel
        case hueBarPadding
        /// Right hue bar selector height
        case hueBarSelectorHeight
        /// Right hue bar selector overflow
        case hueBarSelectorOverflow
    }
}

//MARK: - Global Variables Definition
extension Raylib {
    
}

//MARK: - Module Functions Declaration

// Global gui state control functions
public extension Raylib {
    /// Enable gui controls (global state)
    @inlinable static func guiEnable() {
        RaylibC.GuiEnable()
    }
    
    /// Disable gui controls (global state)
    @inlinable static func guiDisable() {
        RaylibC.GuiDisable()
    }
    
    /// Lock gui controls (global state)
    @inlinable static func guiLock() {
        RaylibC.GuiLock()
    }
    
    /// Unlock gui controls (global state)
    @inlinable static func guiUnlock() {
        RaylibC.GuiUnlock()
    }
    
    /// Check if gui is locked (global state)
    @inlinable static var isGuiLocked: Bool {
        let result = RaylibC.GuiIsLocked()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f
    @inlinable static func guiFade(_ alpha: Float) {
        RaylibC.GuiFade(alpha)
    }
    
    /// Set gui state (global state)
    @inlinable static func guiSetState(_ state: GuiControlState) {
        RaylibC.GuiSetState(state.rawValue)
    }
    
    /// Get gui state (global state)
    @inlinable static var guiState: GuiControlState {
        return GuiControlState(rawValue: RaylibC.GuiGetState())!
    }
}

// Font set/get functions
public extension Raylib {
    /// Set gui custom font (global state)
    @inlinable static func guiSetFont(_ font: Font) {
        RaylibC.GuiSetFont(font)
    }
    
    /// Get gui custom font (global state)
    @inlinable static func guiGetFont() -> Font {
        return RaylibC.GuiGetFont()
    }
}

// Style set/get functions
public extension Raylib {
    /// Set one style property
    @inlinable static func guiSetStyle(control: GuiControl, property: Int32, value: Int32) {
        RaylibC.GuiSetStyle(control.rawValue, property, value)
    }
    
    /// Get one style property
    @inlinable static func guiGetStyle(control: GuiControl, property: Int32) -> Int32 {
        return RaylibC.GuiGetStyle(control.rawValue, property)
    }
}

// Container/separator controls, useful for controls organization
public extension Raylib {
    /// Window Box control, shows a window that can be closed
    @inlinable static func guiWindowBox(bounds: Rectangle, title: String) -> Bool {
        return title.withCString { cString in
            let result = RaylibC.GuiWindowBox(bounds, cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Group Box control with text name
    @inlinable static func guiGroupBox(bounds: Rectangle, text: String) {
        text.withCString { cString in
            RaylibC.GuiGroupBox(bounds, cString)
        }
    }
    
    /// Line separator control, could contain text
    @inlinable static func guiLine(bounds: Rectangle, text: String) {
        text.withCString { cString in
            RaylibC.GuiLine(bounds, cString)
        }
    }
    
    /// Panel control, useful to group controls/
    @inlinable static func guiPanel(bounds: Rectangle) {
        RaylibC.GuiPanel(bounds)
    }
    
    /// Scroll Panel control
    @inlinable static func guiScrollPanel(bounds: Rectangle, content: Rectangle, scroll: inout Vector2) -> Rectangle {
        return RaylibC.GuiScrollPanel(bounds, content, &scroll)
    }
}

// Basic controls set
public extension Raylib {
    /// Label control, shows text
    @inlinable static func guiLabel(bounds: Rectangle, text: String) {
        text.withCString { cString in
            RaylibC.GuiLabel(bounds, cString)
        }
    }
    
    /// Button control, returns true when clicked
    @inlinable static func guiButton(bounds: Rectangle, text: String) -> Bool {
        return text.withCString { cString in
            let result = RaylibC.GuiButton(bounds, cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Label button control, show true when clicked
    @inlinable static func guiLabelButton(bounds: Rectangle, text: String) -> Bool {
        return text.withCString { cString in
            let result = RaylibC.GuiLabelButton(bounds, cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Toggle Button control, returns true when active
    @inlinable static func guiToggle(bounds: Rectangle, text: String, active: Bool) -> Bool {
        return text.withCString { cString in
#if os(Windows)
            let active = bool(active ? 1 : 0)
#endif
            let result = RaylibC.GuiToggle(bounds, cString, active)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Toggle Group control, returns active toggle index
    @inlinable static func guiToggleGroup(bounds: Rectangle, text: String, active: Int32) -> Int32 {
        return text.withCString { cString in
            return RaylibC.GuiToggleGroup(bounds, cString, active)
        }
    }
    
    /// Check Box control, returns true when active
    @inlinable static func guiCheckBox(bounds: Rectangle, text: String, checked: Bool) -> Bool {
        return text.withCString { cString in
#if os(Windows)
            let checked = bool(checked ? 1 : 0)
#endif
            let result = RaylibC.GuiCheckBox(bounds, cString, checked)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Combo Box control, returns selected item index
    @inlinable static func guiComboBox(bounds: Rectangle, text: String, active: Int32) -> Int32 {
        return text.withCString { cString in
            return RaylibC.GuiComboBox(bounds, cString, active)
        }
    }
    
    /// Dropdown Box control, returns selected item
    @inlinable static func guiDropdownBox(bounds: Rectangle, text: String, active: inout Int32, editMode: Bool) -> Bool {
        return text.withCString { cString in
#if os(Windows)
            let editMode = bool(editMode ? 1 : 0)
#endif
            let result = RaylibC.GuiDropdownBox(bounds, cString, &active, editMode)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Spinner control, returns selected value
    @inlinable static func guiSpinner(bounds: Rectangle, text: String, value: inout Int32, minVlaue: Int32, maxValue: Int32, editMode: Bool) -> Bool {
        return text.withCString { cString in
#if os(Windows)
            let editMode = bool(editMode ? 1 : 0)
#endif
            let result = RaylibC.GuiSpinner(bounds, cString, &value, minVlaue, maxValue, editMode)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Value Box control, updates input text with numbers
    @inlinable static func guiValueBox(bounds: Rectangle, text: String, value: inout Int32, minValue: Int32, maxValue: Int32, editMode: Bool) -> Bool {
        return text.withCString { cString in
#if os(Windows)
            let editMode = bool(editMode ? 1 : 0)
#endif
            let result = RaylibC.GuiValueBox(bounds, cString, &value, minValue, maxValue, editMode)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Text Box control, updates input text
    @inlinable static func guiTextBox(bounds: Rectangle, text: inout String, editMode: Bool) -> Bool {
        var cString = text.cString(using: .utf8)!
        let result = cString.withUnsafeMutableBufferPointer { cString in
#if os(Windows)
            let editMode = bool(editMode ? 1 : 0)
#endif
            return RaylibC.GuiTextBox(bounds, cString.baseAddress, Int32(text.utf8.count), editMode)
        }
        text = String(cString: cString)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Text Box control with multiple lines
    @inlinable static func guiTextBoxMulti(bounds: Rectangle, text: inout String, editMode: Bool) -> Bool {
        var cString = text.cString(using: .utf8)!
        let result = cString.withUnsafeMutableBufferPointer { cString in
#if os(Windows)
            let editMode = bool(editMode ? 1 : 0)
#endif
            return RaylibC.GuiTextBoxMulti(bounds, cString.baseAddress, Int32(text.utf8.count), editMode)
        }
        text = String(cString: cString)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Slider control, returns selected value
    @inlinable static func guiSlider(bounds: Rectangle, textLeft: String, textRight: String, value: Float, minValue: Float, maxValue: Float) -> Float {
        return textLeft.withCString { leftCString in
            return textRight.withCString { rightCString in
                return RaylibC.GuiSlider(bounds, leftCString, rightCString, value, minValue, maxValue)
            }
        }
    }
    
    /// Slider Bar control, returns selected value
    @inlinable static func guiSliderBar(bounds: Rectangle, textLeft: String, textRight: String, value: Float, minValue: Float, maxValue: Float) -> Float {
        return textLeft.withCString { leftCString in
            return textRight.withCString { rightCString in
                return RaylibC.GuiSliderBar(bounds, leftCString, rightCString, value, minValue, maxValue)
            }
        }
    }
    
    /// Progress Bar control, shows current progress value
    @inlinable static func guiProgressBar(bounds: Rectangle, textLeft: String, textRight: String, value: Float, minValue: Float, maxValue: Float) -> Float {
        return textLeft.withCString { leftCString in
            return textRight.withCString { rightCString in
                return RaylibC.GuiProgressBar(bounds, leftCString, rightCString, value, minValue, maxValue)
            }
        }
    }
    
    /// Status Bar control, shows info text
    @inlinable static func guiStatusBar(bounds: Rectangle, text: String) {
        text.withCString { cString in
            RaylibC.GuiStatusBar(bounds, cString)
        }
    }
    
    /// Dummy control for placeholders
    @inlinable static func guiDummyRec(bounds: Rectangle, text: String) {
        text.withCString { cString in
            RaylibC.GuiDummyRec(bounds, cString)
        }
    }
    
    /// Scroll Bar control
    @inlinable static func guiScrollBar(bounds: Rectangle, value: Int32, minValue: Int32, maxValue: Int32) -> Int32 {
        return RaylibC.GuiScrollBar(bounds, value, minValue, maxValue)
    }
    
    /// Grid control
    @inlinable static func guiGrid(bounds: Rectangle, spacing: Float, subDivs: Int32) -> Vector2 {
        return RaylibC.GuiGrid(bounds, spacing, subDivs)
    }
}

// Advance controls set
public extension Raylib {
    /// List View control, returns selected list item index
    @inlinable static func guiListView(bounds: Rectangle, text: String, scrollIndex: inout Int32, active: Int32) -> Int32 {
        return text.withCString { cString in
            return RaylibC.GuiListView(bounds, cString, &scrollIndex, active)
        }
    }
    
    /// List View with extended parameters
    @available(*, unavailable, message: "Not implemented for Swift yet.")
    @inlinable static func guiListViewEx(bounds: Rectangle, text: [String], focus: inout Int32, scrollIndex: inout Int32, active: Int32) -> Int32 {
        //TODO: Implement
        // This will require an array of cString pointers for the text
        fatalError()
    }
    
    /// Message Box control, displays a message
    @inlinable static func guiMessagBox(bounds: Rectangle, title: String, message: String, buttons: String) -> Int32 {
        return title.withCString { title in
            return message.withCString { message in
                return buttons.withCString { buttons in
                    return RaylibC.GuiMessageBox(bounds, title, message, buttons)
                }
            }
        }
    }
    
    /// Text Input Box control, ask for text
    @inlinable static func guiTextInputBox(bounds: Rectangle, title: String, message: String, buttons: String, text: inout String) -> Int32 {
        return title.withCString { title in
            return message.withCString { message in
                return buttons.withCString { buttons in
                    var cString = text.cString(using: .utf8)!
                    let returnValue = cString.withUnsafeMutableBufferPointer { cString in
                        return RaylibC.GuiTextInputBox(bounds, title, message, buttons, &cString)
                    }
                    text = String(cString: cString)
                    return returnValue
                }
            }
        }
    }
    
    /// Color Picker control (multiple color controls)
    @inlinable static func guiColorPicker(bounds: Rectangle, color: Color) -> Color {
        return RaylibC.GuiColorPicker(bounds, color)
    }
    
    /// Color Panel control
    @inlinable static func guiColorPanel(bounds: Rectangle, color: Color) -> Color {
        return RaylibC.GuiColorPanel(bounds, color)
    }
    
    /// Color Bar Alpha control
    @inlinable static func guiColorBarAlpha(bounds: Rectangle, alpha: Float) -> Float {
        return RaylibC.GuiColorBarAlpha(bounds, alpha)
    }
    
    /// Color Bar Hue control
    @inlinable static func guiColorBarHue(bounds: Rectangle, value: Float) -> Float {
        return RaylibC.GuiColorBarHue(bounds, value)
    }
}

// Styles loading functions
public extension Raylib {
    /// Load style file over global style variable (.rgs)
    @inlinable static func guiLoadStyle(filename: String) {
        filename.withCString { cString in
            RaylibC.GuiLoadStyle(cString)
        }
    }
    
    /// Load style default over global style
    @inlinable static func guiLoadStyleDefault() {
        RaylibC.GuiLoadStyleDefault()
    }
}

public extension Raylib {
    enum GuiIconName: Int32 {
        case none                       = 0
        case folderFileOpen             = 1
        case fileSaveClassic            = 2
        case folderOpen                 = 3
        case folderSave                 = 4
        case fileOpen                   = 5
        case fileSave                   = 6
        case fileExport                 = 7
        case fileNew                    = 8
        case fileDelete                 = 9
        case filetypeText               = 10
        case filetypeAudio              = 11
        case filetypeImage              = 12
        case filetypePlay               = 13
        case filetypeVideo              = 14
        case filetypeInfo               = 15
        case fileCopy                   = 16
        case fileCut                    = 17
        case filePaste                  = 18
        case cursorhand                 = 19
        case cursorPointer              = 20
        case cursorClassic              = 21
        case pencil                     = 22
        case pencilBig                  = 23
        case brushClassic               = 24
        case brushPainter               = 25
        case waterDrop                  = 26
        case colorPicker                = 27
        case rubber                     = 28
        case colorBucket                = 29
        case textT                      = 30
        case textA                      = 31
        case scale                      = 32
        case resize                     = 33
        case filterPoint                = 34
        case filterBilinear             = 35
        case crop                       = 36
        case cropAlpha                  = 37
        case squareToggle               = 38
        case symmetry                   = 39
        case symmetryHorizontal         = 40
        case symmetryVertical           = 41
        case lens                       = 42
        case lensBig                    = 43
        case eyeOn                      = 44
        case eyeOff                     = 45
        case filterTop                  = 46
        case filter                     = 47
        case targetPoint                = 48
        case targetSmall                = 49
        case targetBig                  = 50
        case targetMove                 = 51
        case cursorMove                 = 52
        case cursorScale                = 53
        case cursorScaleRight           = 54
        case cursorScaleLeft            = 55
        case undo                       = 56
        case redo                       = 57
        case reRedo                     = 58
        case mutate                     = 59
        case rotate                     = 60
        case `repeat`                   = 61
        case shuffle                    = 62
        case emtpyBox                   = 63
        case target                     = 64
        case targetSmallFill            = 65
        case targetBigFill              = 66
        case targetMoveFill             = 67
        case cursorMoveFill             = 68
        case cursorScaleFill            = 69
        case cursorScaleRightFill       = 70
        case cursorScaleLeftFill        = 71
        case undoFill                   = 72
        case redoFill                   = 73
        case reRedoFill                 = 74
        case mutateFill                 = 75
        case rotateFill                 = 76
        case repeatFill                 = 77
        case shuffleFill                = 78
        case emptyBoxSmall              = 79
        case box                        = 80
        case boxTop                     = 81
        case boxTopRight                = 82
        case boxRight                   = 83
        case boxBottomRight             = 84
        case boxBottom                  = 85
        case boxBottomLeft              = 86
        case boxLeft                    = 87
        case boxTopLeft                 = 88
        case boxCenter                  = 89
        case boxCircleMask              = 90
        case pot                        = 91
        case alphaMultiply              = 92
        case alphaClear                 = 93
        case dithering                  = 94
        case mipmaps                    = 95
        case boxGridiconBOX_GRID        = 96
        case grid                       = 97
        case boxCornersSmall            = 98
        case boxCornersBig              = 99
        case fourBoxes                  = 100
        case gridFill                   = 101
        case boxMultisize               = 102
        case zoomSmall                  = 103
        case zoomMedium                 = 104
        case zoomBig                    = 105
        case zoomAll                    = 106
        case zoomCenter                 = 107
        case boxDotsSmall               = 108
        case boxDotsBig                 = 109
        case boxConcentric              = 110
        case boxGridBig                 = 111
        case okTick                     = 112
        case cross                      = 113
        case arrowLeft                  = 114
        case arrowRight                 = 115
        case arrowDown                  = 116
        case arrowUp                    = 117
        case arrowLeftFill              = 118
        case arrowRightFill             = 119
        case arrowDownFill              = 120
        case arrowUpFill                = 121
        case audio                      = 122
        case fx                         = 123
        case wave                       = 124
        case waveSinus                  = 125
        case waveSquare                 = 126
        case waveTriangular             = 127
        case crossSmall                 = 128
        case playerPrevious             = 129
        case playerPlayBack             = 130
        case playerPlay                 = 131
        case playerPause                = 132
        case playerStop                 = 133
        case playerNext                 = 134
        case playerRecord               = 135
        case magnet                     = 136
        case lockClose                  = 137
        case lockOpen                   = 138
        case clock                      = 139
        case tools                      = 140
        case gear                       = 141
        case gearBig                    = 142
        case bin                        = 143
        case handPointer                = 144
        case laser                      = 145
        case coin                       = 146
        case explosion                  = 147
        case oneUp                      = 148
        case player                     = 149
        case playerJump                 = 150
        case key                        = 151
        case demon                      = 152
        case textPopup                  = 153
        case gearEx                     = 154
        case crack                      = 155
        case crackPoints                = 156
        case star                       = 157
        case door                       = 158
        case exit                       = 159
        case mode2D                     = 160
        case mode3D                     = 161
        case cube                       = 162
        case cubeFaceTop                = 163
        case cubeFaceLeft               = 164
        case cubeFaceFront              = 165
        case cubeFaceBottom             = 166
        case cubeFaceRight              = 167
        case cubeFaceBack               = 168
        case camera                     = 169
        case special                    = 170
        case linkNet                    = 171
        case linkBoxes                  = 172
        case linkMulti                  = 173
        case link                       = 174
        case linkBroke                  = 175
        case textNotes                  = 176
        case notebook                   = 177
        case suitcase                   = 178
        case suitcaseZip                = 179
        case mailbox                    = 180
        case monitor                    = 181
        case printer                    = 182
        case photoCamera                = 183
        case photoCameraFlash           = 184
        case house                      = 185
        case heart                      = 186
        case corner                     = 187
        case verticalBars               = 188
        case verticalBarsFill           = 189
        case lifeBars                   = 190
        case info                       = 191
        case crossline                  = 192
        case help                       = 193
        case filetypeAlpha              = 194
        case filetypeHome               = 195
        case layersVisible              = 196
        case layers                     = 197
        case window                     = 198
        case hiDPI                      = 199
        case icon200                    = 200
        case icon201                    = 201
        case icon202                    = 202
        case icon203                    = 203
        case icon204                    = 204
        case icon205                    = 205
        case icon206                    = 206
        case icon207                    = 207
        case icon208                    = 208
        case icon209                    = 209
        case icon210                    = 210
        case icon211                    = 211
        case icon212                    = 212
        case icon213                    = 213
        case icon214                    = 214
        case icon215                    = 215
        case icon216                    = 216
        case icon217                    = 217
        case icon218                    = 218
        case icon219                    = 219
        case icon220                    = 220
        case icon221                    = 221
        case icon222                    = 222
        case icon223                    = 223
        case icon224                    = 224
        case icon225                    = 225
        case icon226                    = 226
        case icon227                    = 227
        case icon228                    = 228
        case icon229                    = 229
        case icon230                    = 230
        case icon231                    = 231
        case icon232                    = 232
        case icon233                    = 233
        case icon234                    = 234
        case icon235                    = 235
        case icon236                    = 236
        case icon237                    = 237
        case icon238                    = 238
        case icon239                    = 239
        case icon240                    = 240
        case icon241                    = 241
        case icon242                    = 242
        case icon243                    = 243
        case icon244                    = 244
        case icon245                    = 245
        case icon246                    = 246
        case icon247                    = 247
        case icon248                    = 248
        case icon249                    = 249
        case icon250                    = 250
        case icon251                    = 251
        case icon252                    = 252
        case icon253                    = 253
        case icon254                    = 254
        case icon255                    = 255
    }
}

public extension Raylib {
    /// Get text with icon id prepended (if supported)
    @inlinable static func guiIconText(iconId: Int32, text: String) -> String {
        return text.withCString { cString in
            if let cString = RaylibC.GuiIconText(iconId, cString) {
                return String(cString: cString)
            }
            fatalError("Should return nil here, becuase nil is possible.")
        }
    }
}

// Gui icons functionality
public extension Raylib {
    @inlinable static func guiDrawIcon(icon: GuiIconName, posX: Int32, posY: Int32, pixelSize: Int32, color: Color) {
        RaylibC.GuiDrawIcon(icon.rawValue, posX, posY, pixelSize, color)
    }
    
    /// Get full icons data pointer
    @inlinable static func guiGetIcons() -> UnsafeMutablePointer<UInt32> {
        return RaylibC.GuiGetIcons()
    }
    
    /// Get icon bit data
    @inlinable static func guiGetIconData(icon: GuiIconName) -> UnsafeMutablePointer<UInt32> {
        return RaylibC.GuiGetIconData(icon.rawValue)
    }
    
    /// Set icon bit data
    @inlinable static func guiSetIconData(icon: GuiIconName, data: [UInt32]) {
        var data = data
        RaylibC.GuiSetIconData(icon.rawValue, &data)
    }
    
    /// Set icon pixel value
    @inlinable static func guiSetIconPixel(icon: GuiIconName, x: Int32, y: Int32) {
        RaylibC.GuiSetIconPixel(icon.rawValue, x, y)
    }
    
    /// Clear icon pixel value/
    @inlinable static func guiClearIconPixel(icon: GuiIconName, x: Int32, y: Int32) {
        RaylibC.GuiClearIconPixel(icon.rawValue, x, y)
    }
    
    /// Check icon pixel value
    @inlinable static func guiCheckIconPixel(icon: GuiIconName, x: Int32, y: Int32) -> Bool {
        let result = RaylibC.GuiCheckIconPixel(icon.rawValue, x, y)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
}
