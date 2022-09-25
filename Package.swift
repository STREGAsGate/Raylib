// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var cSettings: [CSetting] {
    var array: [CSetting] = []
        
    array.append(.define("PLATFORM_DESKTOP", .when(platforms: [.macOS, .windows, .linux])))
    array.append(.define("SUPPORT_DEFAULT_FONT"))
    
    // Windows
    array.append(.define("HOST_PLATFORM_OS", to: "WINDOWS", .when(platforms: [.windows])))
    array.append(.define("_GLFW_WIN32", .when(platforms: [.windows])))
    
    // Linux
    array.append(.define("HOST_PLATFORM_OS", to: "LINUX", .when(platforms: [.linux])))
    array.append(.define("_GLFW_X11", .when(platforms: [.linux])))
    
    // macOS
    array.append(.define("HOST_PLATFORM_OS", to: "OSX", .when(platforms: [.macOS])))
    array.append(.define("_GLFW_COCOA", .when(platforms: [.macOS])))    
    
    array.append(.headerSearchPath("UnmodifiedRaylibSrc/external/glfw/include"))
    array.append(.headerSearchPath("UnmodifiedRaylibSrc"))
    
    return array
}

var sources: [String] {
    var array: [String] = []
    
    // Raylib
    let raylib = ["rcore.c", "rmodels.c", "raudio.c", "rshapes.c", "rtext.c", "rtextures.c", "utils.c"]
    array.append(contentsOf: raylib.map({"UnmodifiedRaylibSrc/" + $0}))
    
    // GLFW Common
    let glfw = ["context.c", "init.c", "input.c", "monitor.c", "vulkan.c", "window.c"]
    array.append(contentsOf: glfw.map({"UnmodifiedRaylibSrc/external/glfw/src/" + $0}))
#if os(macOS)
    let macOSModified = ["cocoa_init.m", "cocoa_window.m", "nsgl_context.m"]
    array.append(contentsOf: macOSModified.map({"ModifiedRaylibSrc/external/glfw/src/" + $0}))
#endif
    
#if os(macOS)
    let mac = ["cocoa_init.m", "cocoa_joystick.m", "cocoa_monitor.m", "cocoa_window.m", "cocoa_time.c", "posix_thread.c", "nsgl_context.m", "egl_context.c", "osmesa_context.c"]
    array.append(contentsOf: mac.map({"UnmodifiedRaylibSrc/external/glfw/src/" + $0}))
#endif
    
#if os(Windows)
    let windows = ["win32_init.c", "win32_joystick.c", "win32_monitor.c", "win32_time.c", "win32_thread.c", "win32_window.c", "wgl_context.c", "egl_context.c", "osmesa_context.c"]
    array.append(contentsOf: windows.map({"UnmodifiedRaylibSrc/external/glfw/src/" + $0}))
#endif
    
#if os(Linux)
    let linux = ["x11_init.c", "x11_monitor.c", "x11_window.c", "xkb_unicode.c", "posix_time.c", "posix_thread.c", "glx_context.c", "egl_context.c", "osmesa_context.c", "linux_joystick.c"]
    array.append(contentsOf: linux.map({"UnmodifiedRaylibSrc/external/glfw/src/" + $0}))
#endif
    return array
}

let package = Package(
    name: "Raylib",
    products: [
        .library(name: "Raylib", targets: ["Raylib", "_RaylibC"]),
        .executable(name: "Example", targets: ["Example"])
    ],
    targets: [
        .target(name: "Example", dependencies: ["Raylib"]),
        .target(name: "Raylib", dependencies: ["_RaylibC"]),
        .target(name: "_RaylibC", exclude: exclude, sources: sources, publicHeadersPath: "Include", cSettings: cSettings),
    ],
    cLanguageStandard: .c99
)

#if os(macOS)
var exclude: [String] {
    return [
        "UnmodifiedRaylibSrc/external/glfw/src/win32_joystick.c",
        "UnmodifiedRaylibSrc/Makefile",
        "UnmodifiedRaylibSrc/raylib.dll.rc.data",
        "UnmodifiedRaylibSrc/external/glfw/src/win32_monitor.c",
        "UnmodifiedRaylibSrc/raylib.ico",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindOSMesa.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/wl_window.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/x86_64-w64-mingw32.cmake",
        "UnmodifiedRaylibSrc/external/glfw/CMake/cmake_uninstall.cmake.in",
        "UnmodifiedRaylibSrc/external/glfw/src/posix_time.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/i686-w64-mingw32.cmake",
        "UnmodifiedRaylibSrc/external/glfw/CMake/Info.plist.in",
        "UnmodifiedRaylibSrc/external/glfw/CMake/i686-w64-mingw32-clang.cmake",
        "UnmodifiedRaylibSrc/external/glfw/CMake/glfw3.pc.in",
        "UnmodifiedRaylibSrc/external/glfw/src/null_window.c",
        "UnmodifiedRaylibSrc/external/glfw/src/wl_monitor.c",
        "UnmodifiedRaylibSrc/external/glfw/LICENSE.md",
        "UnmodifiedRaylibSrc/raylib.dll.rc",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindWaylandProtocols.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/null_monitor.c",
        "UnmodifiedRaylibSrc/external/glfw/src/glfw.rc.in",
        "UnmodifiedRaylibSrc/external/glfw/src/x11_window.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindXKBCommon.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/win32_window.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/x86_64-w64-mingw32-clang.cmake",
        "UnmodifiedRaylibSrc/raylib.rc",
        "UnmodifiedRaylibSrc/external/glfw/README.md",
        "UnmodifiedRaylibSrc/external/glfw/CMake/GenerateMappings.cmake",
        "UnmodifiedRaylibSrc/external/glfw/deps/glad_gl.c",
        "UnmodifiedRaylibSrc/external/glfw/src/x11_init.c",
        "UnmodifiedRaylibSrc/external/glfw/CMakeLists.txt",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindEpollShim.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/null_init.c",
        "UnmodifiedRaylibSrc/external/glfw/src/win32_thread.c",
        "UnmodifiedRaylibSrc/external/glfw/src/mappings.h.in",
        "UnmodifiedRaylibSrc/external/glfw/src/linux_joystick.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/glfw3Config.cmake.in",
        "UnmodifiedRaylibSrc/CMakeLists.txt",
        "UnmodifiedRaylibSrc/external/glfw/src/wgl_context.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/MacOSXBundleInfo.plist.in",
        "UnmodifiedRaylibSrc/external/glfw/src/null_joystick.c",
        "UnmodifiedRaylibSrc/external/glfw/src/xkb_unicode.c",
        "UnmodifiedRaylibSrc/external/glfw/src/x11_monitor.c",
        "UnmodifiedRaylibSrc/rglfw.c",
        "UnmodifiedRaylibSrc/external/glfw/src/win32_init.c",
        "UnmodifiedRaylibSrc/external/glfw/src/glfw_config.h.in",
        "UnmodifiedRaylibSrc/shell.html",
        "UnmodifiedRaylibSrc/minshell.html",
        "UnmodifiedRaylibSrc/external/glfw/deps/getopt.c",
        "UnmodifiedRaylibSrc/raylib.rc.data",
        "UnmodifiedRaylibSrc/external/glfw/src/CMakeLists.txt",
        "UnmodifiedRaylibSrc/external/glfw/src/win32_time.c",
        "UnmodifiedRaylibSrc/external/glfw/src/wl_init.c",
        "UnmodifiedRaylibSrc/external/glfw/deps/glad_vulkan.c",
        "UnmodifiedRaylibSrc/external/glfw/src/glx_context.c",
        "UnmodifiedRaylibSrc/build.zig",
        "UnmodifiedRaylibSrc/minshell.html",
        
        // Replaced with modified source
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_init.m",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_window.m",
        "UnmodifiedRaylibSrc/external/glfw/src/nsgl_context.m",
    ]
}
#endif

#if os(Windows)
//MARK: - Windows Exclude
var exclude: [String] {
    return [
        "UnmodifiedRaylibSrc/external/glfw/src/null_window.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/i686-w64-mingw32-clang.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_joystick.m",
        "UnmodifiedRaylibSrc/external/glfw/src/posix_time.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindWaylandProtocols.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/mappings.h.in",
        "UnmodifiedRaylibSrc/external/glfw/LICENSE.md",
        "UnmodifiedRaylibSrc/external/glfw/src/nsgl_context.m",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindXKBCommon.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/glfw.rc.in",
        "UnmodifiedRaylibSrc/external/glfw/CMake/x86_64-w64-mingw32-clang.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/glx_context.c",
        "UnmodifiedRaylibSrc/raylib.rc.data",
        "UnmodifiedRaylibSrc/external/glfw/src/null_monitor.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/cmake_uninstall.cmake.in",
        "UnmodifiedRaylibSrc/external/glfw/src/wl_init.c",
        "UnmodifiedRaylibSrc/CMakeLists.txt",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_monitor.m",
        "UnmodifiedRaylibSrc/external/glfw/src/x11_window.c",
        "UnmodifiedRaylibSrc/external/glfw/src/posix_thread.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/glfw3.pc.in",
        "UnmodifiedRaylibSrc/raylib.dll.rc.data",
        "UnmodifiedRaylibSrc/external/glfw/src/glfw_config.h.in",
        "UnmodifiedRaylibSrc/external/glfw/src/wl_window.c",
        "UnmodifiedRaylibSrc/raylib.dll.rc",
        "UnmodifiedRaylibSrc/external/glfw/CMake/Info.plist.in",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_time.c",
        "UnmodifiedRaylibSrc/external/glfw/CMakeLists.txt",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindEpollShim.cmake",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindOSMesa.cmake",
        "UnmodifiedRaylibSrc/rglfw.c",
        "UnmodifiedRaylibSrc/external/glfw/src/x11_monitor.c",
        "UnmodifiedRaylibSrc/external/glfw/src/linux_joystick.c",
        "UnmodifiedRaylibSrc/external/glfw/deps/glad_vulkan.c",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_window.m",
        "UnmodifiedRaylibSrc/external/glfw/CMake/MacOSXBundleInfo.plist.in",
        "UnmodifiedRaylibSrc/raylib.rc",
        "UnmodifiedRaylibSrc/Makefile",
        "UnmodifiedRaylibSrc/external/glfw/README.md",
        "UnmodifiedRaylibSrc/external/glfw/CMake/glfw3Config.cmake.in",
        "UnmodifiedRaylibSrc/external/glfw/CMake/i686-w64-mingw32.cmake",
        "UnmodifiedRaylibSrc/external/glfw/CMake/x86_64-w64-mingw32.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/wl_monitor.c",
        "UnmodifiedRaylibSrc/external/glfw/src/x11_init.c",
        "UnmodifiedRaylibSrc/external/glfw/src/null_joystick.c",
        "UnmodifiedRaylibSrc/shell.html",
        "UnmodifiedRaylibSrc/minshell.html",
        "UnmodifiedRaylibSrc/external/glfw/src/null_init.c",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_init.m",
        "UnmodifiedRaylibSrc/external/glfw/src/CMakeLists.txt",
        "UnmodifiedRaylibSrc/external/glfw/src/xkb_unicode.c",
        "UnmodifiedRaylibSrc/external/glfw/deps/getopt.c",
        "UnmodifiedRaylibSrc/external/glfw/deps/glad_gl.c",
        "UnmodifiedRaylibSrc/raylib.ico",
        "UnmodifiedRaylibSrc/external/glfw/CMake/GenerateMappings.cmake",
        "UnmodifiedRaylibSrc/build.zig",
        "UnmodifiedRaylibSrc/minshell.html",
    ]
}
#endif


#if os(Linux)
var exclude: [String] {
    return [
        "UnmodifiedRaylibSrc/external/glfw/src/win32_window.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/Info.plist.in",
        "UnmodifiedRaylibSrc/external/glfw/CMake/glfw3Config.cmake.in",
        "UnmodifiedRaylibSrc/external/glfw/CMake/i686-w64-mingw32.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/nsgl_context.m",
        "UnmodifiedRaylibSrc/external/glfw/CMake/x86_64-w64-mingw32.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/wl_monitor.c",
        "UnmodifiedRaylibSrc/external/glfw/src/null_init.c",
        "UnmodifiedRaylibSrc/external/glfw/src/wl_window.c",
        "UnmodifiedRaylibSrc/raylib.rc.data",
        "UnmodifiedRaylibSrc/raylib.dll.rc.data",
        "UnmodifiedRaylibSrc/external/glfw/src/win32_init.c",
        "UnmodifiedRaylibSrc/external/glfw/src/win32_monitor.c",
        "UnmodifiedRaylibSrc/CMakeLists.txt",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindEpollShim.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/null_window.c",
        "UnmodifiedRaylibSrc/Makefile",
        "UnmodifiedRaylibSrc/external/glfw/src/wl_init.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/glfw3.pc.in",
        "UnmodifiedRaylibSrc/external/glfw/CMake/i686-w64-mingw32-clang.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_monitor.m",
        "UnmodifiedRaylibSrc/external/glfw/src/win32_time.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindXKBCommon.cmake",
        "UnmodifiedRaylibSrc/external/glfw/CMake/x86_64-w64-mingw32-clang.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_joystick.m",
        "UnmodifiedRaylibSrc/external/glfw/deps/glad_vulkan.c",
        "UnmodifiedRaylibSrc/external/glfw/deps/getopt.c",
        "UnmodifiedRaylibSrc/external/glfw/README.md",
        "UnmodifiedRaylibSrc/external/glfw/src/glfw.rc.in",
        "UnmodifiedRaylibSrc/external/glfw/CMakeLists.txt",
        "UnmodifiedRaylibSrc/external/glfw/src/win32_thread.c",
        "UnmodifiedRaylibSrc/external/glfw/src/mappings.h.in",
        "UnmodifiedRaylibSrc/external/glfw/CMake/GenerateMappings.cmake",
        "UnmodifiedRaylibSrc/rglfw.c",
        "UnmodifiedRaylibSrc/shell.html",
        "UnmodifiedRaylibSrc/minshell.html",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_window.m",
        "UnmodifiedRaylibSrc/external/glfw/src/null_joystick.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/cmake_uninstall.cmake.in",
        "UnmodifiedRaylibSrc/raylib.rc",
        "UnmodifiedRaylibSrc/raylib.dll.rc",
        "UnmodifiedRaylibSrc/raylib.ico",
        "UnmodifiedRaylibSrc/external/glfw/src/win32_joystick.c",
        "UnmodifiedRaylibSrc/external/glfw/src/null_monitor.c",
        "UnmodifiedRaylibSrc/external/glfw/CMake/MacOSXBundleInfo.plist.in",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindWaylandProtocols.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_time.c",
        "UnmodifiedRaylibSrc/external/glfw/src/CMakeLists.txt",
        "UnmodifiedRaylibSrc/external/glfw/LICENSE.md",
        "UnmodifiedRaylibSrc/external/glfw/src/cocoa_init.m",
        "UnmodifiedRaylibSrc/external/glfw/deps/glad_gl.c",
        "UnmodifiedRaylibSrc/external/glfw/src/glfw_config.h.in",
        "UnmodifiedRaylibSrc/external/glfw/CMake/modules/FindOSMesa.cmake",
        "UnmodifiedRaylibSrc/external/glfw/src/wgl_context.c",
        "UnmodifiedRaylibSrc/build.zig",
        "UnmodifiedRaylibSrc/minshell.html",
    ]
}
#endif
