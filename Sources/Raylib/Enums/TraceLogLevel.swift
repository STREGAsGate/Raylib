/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

public enum TraceLogLevel: Int32 {
    case all = 0    // Display all logs
    case trace
    case debug
    case info
    case warning
    case error
    case fatal
    case none       // Disable logging
}
