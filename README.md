# Raylib for Swift
<a href="https://swift.org"><img style="vertical-align:middle" src=https://aws1.discourse-cdn.com/swift/original/1X/0a90dde98a223f5841eeca49d89dc9f57592e8d6.png width="50"></a><a href="https://www.raylib.com"><img style="vertical-align:middle" src=https://www.raylib.com/common/img/raylib_logo.png width="50"></a>

[![Windows](https://github.com/STREGAsGate/Raylib/actions/workflows/Windows.yml/badge.svg)](https://github.com/STREGAsGate/Raylib/actions/workflows/Windows.yml) [![macOS](https://github.com/STREGAsGate/Raylib/actions/workflows/macOS.yml/badge.svg)](https://github.com/STREGAsGate/Raylib/actions/workflows/macOS.yml) [![Linux](https://github.com/STREGAsGate/Raylib/actions/workflows/Linux.yml/badge.svg)](https://github.com/STREGAsGate/Raylib/actions/workflows/Linux.yml) 

[![Twitter](https://img.shields.io/twitter/follow/stregasgate?style=social)](https://twitter.com/stregasgate)
[![YouTube](https://img.shields.io/youtube/channel/subscribers/UCBXFkK2B4w9856wBJfCGufg?label=Subscribe&style=social)](https://youtube.com/stregasgate)
[![Reddit](https://img.shields.io/reddit/subreddit-subscribers/stregasgate?style=social)](https://www.reddit.com/r/stregasgate/)
[![Discord](https://img.shields.io/discord/641809158051725322?label=Hang%20Out&logo=Discord&style=social)](https://discord.gg/5JdRJhD)

This package brings [Raylib](https://www.raylib.com/) to [Swift](https://www.swift.org/).

Raylib for Swift uses Swift's C interoperability and compiler to build Raylib from source code. Just add the package as a dependency (to your swift executable package) and start making games!

## Requirements & Setup

On Windows and macOS you only need Swift. For Linux, see [install required libraries](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux#install-required-libraries).

### Creating a new project

**1.** Create a Swift package for your project.

```Bash
$ cd my/projects/folder/path
$ mkdir MyGame
$ cd MyGame
$ swift package init --type executable
```

**2.** Edit the newly created `Package.swift` to add Raylib to the dependencies array:

```swift
.package(url: "https://github.com/STREGAsGate/Raylib.git", branch: "master")
```

On Windows and macOS you only need Swift. For linux, see [install required libraries](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux#install-required-libraries).

  > Note: `.branch("master")` is required, you cannot use tags, commits, or versions. Swift doesn't allow unsafe build flags for specific versions and build flags are required to build Raylib, so you must use master at this time or you will get an error from SwiftPM.

**3.** Add the following to the `static func main()` in MyGame.swift.

```Swift
    let screenWidth: Int32 = 800
    let screenHeight: Int32 = 450

    Raylib.initWindow(screenWidth, screenHeight, "MyGame")
    Raylib.setTargetFPS(30)
    let randomColors: [Color] = [.blue, .red, .green, .yellow, .darkBlue, .maroon, .magenta]
    var ballColor: Color = .maroon
    var ballPosition = Vector2(x: -100, y: -100)
    var previousBallPosition: Vector2
    while Raylib.windowShouldClose == false {
        // update
        previousBallPosition = ballPosition
        ballPosition = Raylib.getMousePosition()
        if Raylib.isMouseButtonDown(.left) {
            ballColor = randomColors.randomElement() ?? .black
        }
        let size = max(abs(ballPosition.x - previousBallPosition.x) + abs(ballPosition.y - previousBallPosition.y), 10)

        // draw
        Raylib.beginDrawing()
        Raylib.clearBackground(.rayWhite)
        Raylib.drawText("Hello, world!", 425, 25, 25, .darkGray)
        Raylib.drawCircleV(ballPosition, size, ballColor)
        Raylib.drawFPS(10, 10)
        Raylib.endDrawing()
    }
    Raylib.closeWindow()
```

## About

Original Raylib global functions are now static members of the `Raylib` type.

```swift
Raylib.initWindow(screenWidth, screenheight, "My First Raylib Window!")
```

It's a goal of this project to have all the global functions available on their respective types as members.

As an example `Image`, now has new initializers.
```swift
let image = Image(color: .green, width: 256, height: 256)
```
Doing this for the entire API will increase discoverability and make Raylib for Swift a more Swifty experience.
