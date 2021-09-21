# Raylib for Swift
<a href="https://swift.org"><img style="vertical-align:middle" src=https://aws1.discourse-cdn.com/swift/original/1X/0a90dde98a223f5841eeca49d89dc9f57592e8d6.png width="50"></a><a href="https://www.raylib.com"><img style="vertical-align:middle" src=https://www.raylib.com/common/img/raylib_logo.png width="50"></a>

[![Windows](https://github.com/STREGAsGate/Raylib/actions/workflows/Windows.yml/badge.svg)](https://github.com/STREGAsGate/Raylib/actions/workflows/Windows.yml) [![macOS](https://github.com/STREGAsGate/Raylib/actions/workflows/macOS.yml/badge.svg)](https://github.com/STREGAsGate/Raylib/actions/workflows/macOS.yml) [![Linux](https://github.com/STREGAsGate/Raylib/actions/workflows/Linux.yml/badge.svg)](https://github.com/STREGAsGate/Raylib/actions/workflows/Linux.yml) 

[![Twitter](https://img.shields.io/twitter/follow/stregasgate?style=social)](https://twitter.com/stregasgate)
[![YouTube](https://img.shields.io/youtube/channel/subscribers/UCBXFkK2B4w9856wBJfCGufg?label=Subscribe&style=social)](https://youtube.com/stregasgate)
[![Reddit](https://img.shields.io/reddit/subreddit-subscribers/stregasgate?style=social)](https://www.reddit.com/r/stregasgate/)
[![Discord](https://img.shields.io/discord/641809158051725322?label=Hang%20Out&logo=Discord&style=social)](https://discord.gg/5JdRJhD)

This package brings Raylib to Swift.
## Setup
Raylib for Swift uses Swift's C interoperability and compiler to build Raylib from source code.
So there's no setup required, just add the package as a dependency and start making games!
```swift
.package(url: "https://github.com/STREGAsGate/Raylib.git", .branch("master"))
```
On Windows and macOS you only need Swift. For linux, see [install required libraries](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux#install-required-libraries).

## Swifty
Original global functions are now static members of the `Raylib` type.
```swift
Raylib.initWindow(screenWidth, screenheight, "My First Raylib Window!")
```

## To Do
It's a goal of this project to have all the global functions available on their respective types as members.

As an example `Image`, now has new initializers.
```swift
let image = Image(color: .green, width: 256, height: 256)
```
Doing this for the entire API will increase discoverability and make Raylib for Swift a more Swifty experience.

---
# Official Readme

<img align="left" src="https://github.com/raysan5/raylib/blob/master/logo/raylib_logo_animation.gif" width="288px">

**raylib is a simple and easy-to-use library to enjoy videogames programming.**

raylib is highly inspired by Borland BGI graphics lib and by XNA framework and it's specially well suited for prototyping, tooling, graphical applications, embedded systems and education.

*NOTE for ADVENTURERS: raylib is a programming library to enjoy videogames programming; no fancy interface, no visual helpers, no auto-debugging... just coding in the most pure spartan-programmers way.*

Ready to learn? Jump to [code examples!](http://www.raylib.com/examples.html)

---

<br>

[![GitHub contributors](https://img.shields.io/github/contributors/raysan5/raylib)](https://github.com/raysan5/raylib/graphs/contributors)
[![GitHub All Releases](https://img.shields.io/github/downloads/raysan5/raylib/total)](https://github.com/raysan5/raylib/releases)
[![GitHub commits since tagged version](https://img.shields.io/github/commits-since/raysan5/raylib/3.7.0)](https://github.com/raysan5/raylib/commits/master)
[![License](https://img.shields.io/badge/license-zlib%2Flibpng-blue.svg)](LICENSE)

[![Chat on Discord](https://img.shields.io/discord/426912293134270465.svg?logo=discord)](https://discord.gg/raylib)
[![GitHub stars](https://img.shields.io/github/stars/raysan5/raylib?style=social)](https://github.com/raysan5/raylib/stargazers)
[![Twitter Follow](https://img.shields.io/twitter/follow/raysan5?style=social)](https://twitter.com/raysan5)
[![Subreddit subscribers](https://img.shields.io/reddit/subreddit-subscribers/raylib?style=social)](https://www.reddit.com/r/raylib/)

[![Windows](https://github.com/raysan5/raylib/workflows/Windows/badge.svg)](https://github.com/raysan5/raylib/actions?query=workflow%3AWindows)
[![Linux](https://github.com/raysan5/raylib/workflows/Linux/badge.svg)](https://github.com/raysan5/raylib/actions?query=workflow%3ALinux)
[![macOS](https://github.com/raysan5/raylib/workflows/macOS/badge.svg)](https://github.com/raysan5/raylib/actions?query=workflow%3AmacOS)
[![Android](https://github.com/raysan5/raylib/workflows/Android/badge.svg)](https://github.com/raysan5/raylib/actions?query=workflow%3AAndroid)
[![WebAssembly](https://github.com/raysan5/raylib/workflows/WebAssembly/badge.svg)](https://github.com/raysan5/raylib/actions?query=workflow%3AWebAssembly)

[![CMakeBuilds](https://github.com/raysan5/raylib/workflows/CMakeBuilds/badge.svg)](https://github.com/raysan5/raylib/actions?query=workflow%3ACMakeBuilds)
[![Windows Examples](https://github.com/raysan5/raylib/actions/workflows/windows_examples.yml/badge.svg)](https://github.com/raysan5/raylib/actions/workflows/windows_examples.yml)
[![Linux Examples](https://github.com/raysan5/raylib/actions/workflows/linux_examples.yml/badge.svg)](https://github.com/raysan5/raylib/actions/workflows/linux_examples.yml)

features
--------
  - **NO external dependencies**, all required libraries are [bundled into raylib](https://github.com/raysan5/raylib/tree/master/src/external)
  - Multiple platforms supported: **Windows, Linux, MacOS, RPI, Android, HTML5... and more!**
  - Written in plain C code (C99) in PascalCase/camelCase notation
  - Hardware accelerated with OpenGL (**1.1, 2.1, 3.3 or ES 2.0**)
  - **Unique OpenGL abstraction layer** (usable as standalone module): [rlgl](https://github.com/raysan5/raylib/blob/master/src/rlgl.h)
  - Multiple **Fonts** formats supported (TTF, XNA fonts, AngelCode fonts)
  - Multiple texture formats supported, including **compressed formats** (DXT, ETC, ASTC)
  - **Full 3D support**, including 3D Shapes, Models, Billboards, Heightmaps and more! 
  - Flexible Materials system, supporting classic maps and **PBR maps**
  - **Animated 3D models** supported (skeletal bones animation) (IQM, glTF)
  - Shaders support, including model and **postprocessing** shaders.
  - **Powerful math module** for Vector, Matrix and Quaternion operations: [raymath](https://github.com/raysan5/raylib/blob/master/src/raymath.h)
  - Audio loading and playing with streaming support (WAV, OGG, MP3, FLAC, XM, MOD)
  - **VR stereo rendering** support with configurable HMD device parameters
  - Huge examples collection with [+120 code examples](https://github.com/raysan5/raylib/tree/master/examples)!
  - Bindings to [+50 programming languages](https://github.com/raysan5/raylib/blob/master/BINDINGS.md)!
  - **Free and open source**.

raylib uses internally some libraries for window/graphics/inputs management and also to support different fileformats loading, all those libraries are embedded with raylib and are available in [src/external](https://github.com/raysan5/raylib/tree/master/src/external) directory. Check [raylib dependencies](https://github.com/raysan5/raylib/wiki/raylib-dependencies) on [raylib Wiki](https://github.com/raysan5/raylib/wiki) for a detailed list.

basic example
--------------
This is a basic raylib example, it creates a window and it draws the text `"Congrats! You created your first window!"` in the middle of the screen. Check this example [running live on web here](https://www.raylib.com/examples/web/core/loader.html?name=core_basic_window).
```c
#include "raylib.h"

int main(void)
{
    InitWindow(800, 450, "raylib [core] example - basic window");

    while (!WindowShouldClose())
    {
        BeginDrawing();
            ClearBackground(RAYWHITE);
            DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
        EndDrawing();
    }

    CloseWindow();

    return 0;
}
```

build and installation
----------------------

raylib binary releases for Windows, Linux and macOS are available at the [Github Releases page](https://github.com/raysan5/raylib/releases).

raylib is also available via multiple [package managers](https://github.com/raysan5/raylib/issues/613) on multiple OS distributions.

#### Installing and building raylib via vcpkg

You can download and install raylib using the [vcpkg](https://github.com/Microsoft/vcpkg) dependency manager:

      git clone https://github.com/Microsoft/vcpkg.git
      cd vcpkg
      ./bootstrap-vcpkg.sh
      ./vcpkg integrate install
      vcpkg install raylib

*The raylib port in vcpkg is kept up to date by Microsoft team members and community contributors. If the version is out of date, please [create an issue or pull request](https://github.com/Microsoft/vcpkg) on the vcpkg repository.*

#### Installing and building raylib via conan

You can download and install raylib using the [conan](https://conan.io) dependency manager:

      https://docs.conan.io/en/latest/getting_started.html

*The raylib recipe in conan is kept up to date by conan team members and community contributors. If the version is out of date, please [create an issue or pull request](https://github.com/conan-io/conan-center-index) on the conan-center-index repository.*

#### Installing and building raylib on multiple platforms

[raylib Wiki](https://github.com/raysan5/raylib/wiki#development-platforms) contains detailed instructions on building and usage on multiple platforms.

 - [Working on Windows](https://github.com/raysan5/raylib/wiki/Working-on-Windows)
 - [Working on macOS](https://github.com/raysan5/raylib/wiki/Working-on-macOS)
 - [Working on GNU Linux](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux)
 - [Working on FreeBSD](https://github.com/raysan5/raylib/wiki/Working-on-FreeBSD)
 - [Working on Raspberry Pi](https://github.com/raysan5/raylib/wiki/Working-on-Raspberry-Pi)
 - [Working for Android](https://github.com/raysan5/raylib/wiki/Working-for-Android)
 - [Working for Web (HTML5)](https://github.com/raysan5/raylib/wiki/Working-for-Web-(HTML5))
 - [Working anywhere with CMake](https://github.com/raysan5/raylib/wiki/Working-with-CMake)

*Note that Wiki is open for edit, if you find some issue while building raylib for your target platform, feel free to edit the Wiki or open and issue related to it.*

#### Setup raylib with multiple IDEs

raylib has been developed on Windows platform using [Notepad++](https://notepad-plus-plus.org/) and [MinGW GCC](http://mingw-w64.org/doku.php) compiler but it can be used with other IDEs on multiple platforms.

[Projects directory](https://github.com/raysan5/raylib/tree/master/projects) contains several ready-to-use **project templates** to build raylib and code examples with multiple IDEs.

*Note that there are lots of IDEs supported, some of the provided templates could require some review, please, if you find some issue with some template or you think they could be improved, feel free to send a PR or open a related issue.*

learning and docs
------------------

raylib is designed to be learned using [the examples](https://github.com/raysan5/raylib/tree/master/examples) as the main reference. There is no standard API documentation but there is a [**cheatsheet**](https://www.raylib.com/cheatsheet/cheatsheet.html) containing all the functions available on the library and a short description of each one of them, input parameters and result value names should be intuitive enough to understand how each function works. 

Some additional documentation about raylib design can be found in raylib GitHub Wiki. Here the more relevant links:

 - [raylib cheatsheet](https://www.raylib.com/cheatsheet/cheatsheet.html)
 - [raylib architecture](https://github.com/raysan5/raylib/wiki/raylib-architecture)
 - [raylib library design](https://github.com/raysan5/raylib/wiki)
 - [raylib examples collection](https://github.com/raysan5/raylib/tree/master/examples)
 - [raylib games collection](https://github.com/raysan5/raylib-games)


contact and networks
---------------------

raylib is present in several networks and raylib community is growing everyday. If you are using raylib and enjoying it, feel free to join us in any of these networks. The most active network is our [Discord server](https://discord.gg/raylib)! :)

 - Webpage: [http://www.raylib.com](http://www.raylib.com)
 - Discord: [https://discord.gg/raylib](https://discord.gg/raylib)
 - Twitter: [http://www.twitter.com/raysan5](http://www.twitter.com/raysan5)
 - Twitch:  [http://www.twitch.tv/raysan5](http://www.twitch.tv/raysan5)
 - Reddit:  [https://www.reddit.com/r/raylib](https://www.reddit.com/r/raylib)
 - Patreon: [https://www.patreon.com/raylib](https://www.patreon.com/raylib)
 - YouTube: [https://www.youtube.com/channel/raylib](https://www.youtube.com/c/raylib)

license
-------

raylib is licensed under an unmodified zlib/libpng license, which is an OSI-certified, BSD-like license that allows static linking with closed source software. Check [LICENSE](LICENSE) for further details.
