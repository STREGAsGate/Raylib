/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
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
