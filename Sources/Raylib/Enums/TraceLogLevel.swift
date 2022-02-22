/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

public enum TraceLogLevel: Int32 {
    /// Display all logs
    case all
    /// Trace logging, intended for internal use only
    case trace
    /// Debug logging, used for internal debugging, it should be disabled on release builds
    case debug
    /// Info logging, used for program execution info
    case info
    /// Warning logging, used on recoverable failures
    case warning
    /// Error logging, used on unrecoverable failures
    case error
    /// Fatal logging, used to abort program: exit(EXIT_FAILURE)
    case fatal
    /// Disable logging
    case none
}
