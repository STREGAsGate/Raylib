/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import Raylib

//MARK: - Initialization

let screenWidth: Int32 = 800
let screenheight: Int32 = 450

Raylib.initWindow(screenWidth, screenheight, "raylib [core] example - basic window")

Raylib.setTargetFPS(60)

//MARK: - Main game loop

while Raylib.windowShouldClose == false {
    //MARK: - Update
    //TODO: Update your variables here

    //MARK: - Draw
    Raylib.beginDrawing()

    Raylib.clearBackground(.rayWhite)

    Raylib.drawText("Congrats! You created your first window!", 190, 200, 20, .lightGray)

    Raylib.endDrawing()
}

//MARK: - De-Initialization

Raylib.closeWindow()
