/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

public extension NPatchInfo {
    init(source: Rectangle, left: Int32, top: Int32, right: Int32, bottom: Int32, layout: NPatchLayout) {
        self.init(source: source, left: left, top: top, right: right, bottom: bottom, __layout: layout.rawValue)
    }
    
    var layout: NPatchLayout {
        get {
            return NPatchLayout(rawValue: __layout)!
        }
        set {
            __layout = newValue.rawValue
        }
    }
}
