/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import RaylibC

public extension NPatchInfo {
    var layout: NPatchLayout {
        get {
            return NPatchLayout(rawValue: _layout)!
        }
        set {
            _layout = newValue.rawValue
        }
    }
}
